import 'package:commerce_mobile/core/services/launcher_service.dart';
import 'package:commerce_mobile/core/utils/app_constants.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/data/models/order_model.dart';
import 'package:commerce_mobile/data/repositories/payment_method_model.dart';
import 'package:commerce_mobile/data/repositories/payment_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_event.dart';
part 'payment_state.dart';
part 'payment_bloc.freezed.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final _repository = PaymentRepositoryImpl();

  PaymentBloc(OrderData order) : super(PaymentState(order: order, methods: AppConstants.paymentMethods)) {
    on<PaymentChangeMethod>((event, emit) {
      emit(state.copyWith(method: event.method));
    });

    on<PaymentSendRequest>((event, emit) async {
      FormzSubmissionStatus formzStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(formzStatus: formzStatus));

      String? checkoutUrl;
      final result = await _repository.createPayment(state.order.orderId, "CARD");
      if (result.isRight()) {
        checkoutUrl = result.getOrElse(() => throw Exception("Unexpected error"));
        formzStatus = FormzSubmissionStatus.success;
      } else {
        formzStatus = FormzSubmissionStatus.failure;
      }

      emit(state.copyWith(formzStatus: formzStatus));
      if(checkoutUrl != null) LauncherService.launcherApplication(checkoutUrl);
    });
  }
}
