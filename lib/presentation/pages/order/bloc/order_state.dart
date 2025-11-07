part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus formzStatus,
    @Default(false) bool isCreatingOrder,
    @Default(false) bool isValidating,
    @Default(null) OrderModel? orderModel,
    @Default(null) OrderData? orderData,
    @Default(null) String? errorMessage,
    @Default(null) OrderModel? failedOrder,
    @Default(false) bool isOrderValid,
    @Default(false) bool hasProducts,
    @Default(false) bool hasReceiverInfo,
    @Default(false) bool hasAddress,
    @Default(null) String? requestUUID,
    @Default(0.0) double totalPrice,
    @Default('') String currency,
  }) = _OrderState;

  const OrderState._();

  // Computed properties
  bool get canCreateOrder =>
      hasProducts && hasReceiverInfo && hasAddress && !isCreatingOrder;

  bool get hasError => errorMessage != null;

  bool get isSuccess =>
      formzStatus == FormzSubmissionStatus.success && orderData != null;
}
