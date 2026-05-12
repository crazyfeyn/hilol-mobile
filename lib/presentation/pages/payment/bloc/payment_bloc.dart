import 'dart:developer' as PaymentFlowLogger;
import 'package:commerce_mobile/core/extension/extensions.dart';
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
      emit(state.copyWith(formzStatus: FormzSubmissionStatus.inProgress));

      // Step 1: Always confirm order first
      final confirmed = await _confirmOrder(state.order);
      if (!confirmed) {
        emit(state.copyWith(formzStatus: FormzSubmissionStatus.canceled));
        return;
      }

      // Step 2: Create payment session
      final paymentResult = await _repository.createPayment(
        state.order.orderId,
        'CARD',
      );

      if (paymentResult.isRight()) {
        final paymentData = paymentResult.getOrElse(
          () => throw Exception('Unexpected error'),
        );
        emit(
          state.copyWith(
            order: state.order.copyWith(
              productTotalPrice: paymentData.productTotalPrice,
              deliveryFee: paymentData.deliveryFee,
              totalPrice: paymentData.totalAmount,
              currency: paymentData.currency,
            ),
            formzStatus: FormzSubmissionStatus.success,
            paymentUrl: paymentData.checkoutUrl,
          ),
        );
      } else {
        emit(state.copyWith(formzStatus: FormzSubmissionStatus.failure));
      }
    });
  }

  Future<bool> _confirmOrder(OrderData order) async {
    PaymentFlowLogger.log(
      'confirmOrder: PUT /api/v1/order/confirm orderId=${order.orderId}',
    );
    final result = await _repository.confirmOrder(order.orderId);
    return result.fold(
      (err) {
        PaymentFlowLogger.log('confirmOrder failed: $err');
        return false;
      },
      (ok) {
        PaymentFlowLogger.log('confirmOrder success=$ok');
        return ok;
      },
    );
  }
}
