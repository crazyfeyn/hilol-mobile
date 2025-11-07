part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.createOrder({
    required OrderModel orderModel,
    required String requestUUID,
  }) = OrderCreateRequested;

  const factory OrderEvent.validateOrder({required OrderModel orderModel}) =
      OrderValidationRequested;

  const factory OrderEvent.resetOrder() = OrderResetRequested;

  const factory OrderEvent.retryOrder() = OrderRetryRequested;
  const factory OrderEvent.calculateTotal({
    required List<CartModel> cartItems,
  }) = OrderTotalCalculated;

  const factory OrderEvent.clearError() = OrderErrorCleared;

  const factory OrderEvent.dispose() = OrderDisposed;
}
