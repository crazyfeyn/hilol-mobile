part of 'payment_bloc.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus formzStatus,
    @Default(PaymentMethod.tossBank) PaymentMethod method,
    required List<PaymentMethodModel> methods,
    required List<CartModel> carts,
    required AddressModel address,
}) = _PaymentState;

  const PaymentState._();
}
