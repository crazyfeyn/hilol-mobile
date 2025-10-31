part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default(FormzSubmissionStatus.inProgress) FormzSubmissionStatus formzStatus,
    @Default([]) List<CartModel> carts,
    @Default(0.0) double subtotal,
    @Default(0.0) double percent,
}) = _CartState;

  const CartState._();
}
