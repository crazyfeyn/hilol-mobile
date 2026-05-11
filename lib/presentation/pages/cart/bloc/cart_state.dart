part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default(FormzSubmissionStatus.inProgress)
    FormzSubmissionStatus formzStatus,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus checkoutStatus,
    @Default([]) List<CartModel> carts,
    @Default(0.0) double subtotal,
    @Default(0.0) double percent,
    @Default(0) int removedCount,
  }) = _CartState;

  const CartState._();
}
