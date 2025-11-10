part of 'my_order_bloc.dart';

@freezed
class MyOrderState with _$MyOrderState {
  const factory MyOrderState({
    @Default(FormzSubmissionStatus.inProgress) FormzSubmissionStatus formzStatus,
    @Default([]) List<OrderData> allOrders,
    @Default([]) List<OrderData> newOrders,
}) = _MyOrderState;

  const MyOrderState._();
}
