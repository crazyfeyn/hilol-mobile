import 'dart:developer' as PaymentFlowLogger;
import 'package:commerce_mobile/core/extension/extensions.dart';
import 'package:commerce_mobile/core/services/launcher_service.dart';
import 'package:commerce_mobile/core/utils/app_constants.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/data/models/order_model.dart';
import 'package:commerce_mobile/data/models/payment_method_model.dart';
import 'package:commerce_mobile/data/repositories/payment_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_event.dart';
part 'payment_state.dart';
part 'payment_bloc.freezed.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final _repository = PaymentRepositoryImpl();

  PaymentBloc(OrderData order)
    : super(PaymentState(order: order, methods: AppConstants.paymentMethods)) {
    on<PaymentChangeMethod>((event, emit) {
      emit(state.copyWith(method: event.method));
    });

    on<PaymentSendRequest>((event, emit) async {
      FormzSubmissionStatus formzStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(formzStatus: formzStatus));

      PaymentFlowLogger.log(
        'PaymentSendRequest: orderId=${state.order.orderId} orderStatus=${state.order.orderStatus}',
      );

      String? checkoutUrl;

      // Prefer creating the payment session without calling confirm first so the server
      // does not run confirm-side logic (e.g. inventory) before the user pays on the web.
      var paymentResult = await _repository.createPayment(
        state.order.orderId,
        'CARD',
      );
      if (paymentResult.isLeft()) {
        final err = paymentResult.fold((l) => l, (_) => '');
        PaymentFlowLogger.log(
          'createPayment without confirm failed: $err — falling back to confirmOrder then createPayment',
        );
        if (!await _confirmOrder(state.order)) {
          formzStatus = FormzSubmissionStatus.canceled;
          PaymentFlowLogger.log(
            'confirmOrder failed or cancelled; not opening checkout',
          );
          emit(state.copyWith(formzStatus: formzStatus));
          return;
        }
        paymentResult = await _repository.createPayment(
          state.order.orderId,
          'CARD',
        );
      }

      if (paymentResult.isRight()) {
        final paymentData = paymentResult.getOrElse(
          () => throw Exception('Unexpected error'),
        );
        checkoutUrl = paymentData.checkoutUrl;
        emit(
          state.copyWith(
            order: state.order.copyWith(
              productTotalPrice: paymentData.productTotalPrice,
              deliveryFee: paymentData.deliveryFee,
              totalPrice: paymentData.totalAmount,
              currency: paymentData.currency,
            ),
          ),
        );
        formzStatus = FormzSubmissionStatus.success;
        PaymentFlowLogger.log(
          'checkoutUrl ready; opening external browser with amount=${paymentData.totalAmount} ${paymentData.currency}',
        );
      } else {
        formzStatus = FormzSubmissionStatus.failure;
        PaymentFlowLogger.log(
          'createPayment failed after fallback: ${paymentResult.fold((l) => l, (_) => '')}',
        );
      }

      emit(state.copyWith(formzStatus: formzStatus));
      if (checkoutUrl != null) {
        await LauncherService.launcherApplication(checkoutUrl);
      }
    });
  }

  Future<bool> _confirmOrder(OrderData order) async {
    // Only skip if order is already confirmed or beyond (e.g., PROCESSING, SHIPPED, DELIVERED)
    // DO NOT skip for NEW or WAITING – those need confirmation.
    final status = order.orderStatus;
    if (status != 'NEW' && status != 'WAITING') {
      PaymentFlowLogger.log(
        'confirmOrder skipped (order already past NEW/WAITING) – status: $status',
      );
      return true;
    }

    PaymentFlowLogger.log(
      'confirmOrder: PUT /api/v1/order/confirm orderId=${order.orderId}',
    );
    final result = await _repository.confirmOrder(state.order.orderId);
    if (result.isRight()) {
      final ok = result.getOrElse(() => throw Exception('Unexpected error'));
      PaymentFlowLogger.log('confirmOrder response success=$ok');
      return ok;
    }

    PaymentFlowLogger.log(
      'confirmOrder failed: ${result.fold((l) => l, (_) => '')}',
    );
    return false;
  }
}
