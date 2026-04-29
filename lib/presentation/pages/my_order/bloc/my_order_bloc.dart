// import 'package:commerce_mobile/core/extension/extensions.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/data/models/order_model.dart';
import 'package:commerce_mobile/data/repositories/order_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_order_event.dart';
part 'my_order_state.dart';
part 'my_order_bloc.freezed.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  final _repository = OrderRepositoryImpl();

  MyOrderBloc() : super(const MyOrderState()) {
    on<MyOrderFetchData>((event, emit) async {
      emit(state.copyWith(formzStatus: FormzSubmissionStatus.inProgress));

      final result = await _repository.fetchMyOrders();
      result.fold(
        (failure) {
          // Show error snackbar (handled in UI by listening to state)
          emit(state.copyWith(formzStatus: FormzSubmissionStatus.failure));
        },
        (allOrders) {
          emit(
            state.copyWith(
              allOrders: allOrders,
              newOrders: _fetchCurrentOrders(allOrders),
              formzStatus: FormzSubmissionStatus.success,
            ),
          );
        },
      );
    });

    on<MyOrderDispose>((event, emit) {
      // Dispose only when bloc is closed, not on deactivate
    });

    //!
    // on<MyOrderCancel>((event, emit) async {
    //   final order = state.allOrders.firstWhere((e) => e.orderId == event.id);
    //   if (!order.orderStatus.isCancellable) return;

    //   emit(state.copyWith(formzStatus: FormzSubmissionStatus.inProgress));

    //   final result = await _repository.cancelMyOrder(event.id);
    //   if (result.isRight()) {
    //     final res = result.getOrElse(() => throw Exception("Unexpected error"));
    //     if (res) {
    //       add(MyOrderFetchData());
    //     } else {
    //       emit(state.copyWith(formzStatus: FormzSubmissionStatus.canceled));
    //     }
    //   } else {
    //     emit(state.copyWith(formzStatus: FormzSubmissionStatus.failure));
    //   }
    // });
    // on<MyOrderDispose>((event, emit) => _repository.dispose());
  }

  List<OrderData> _fetchCurrentOrders(List<OrderData> allOrders) {
    // Orders that should NOT appear in "Current orders" tab
    const excludedStatuses = [
      'PAYMENT_FAILED', // failed – done
      'PAYMENT_SUCCEEDED', // paid – done (if you want to move to all orders)
      'CANCELLED',
      'COMPLETED',
      'DELIVERED',
    ];
    return allOrders
        .where(
          (order) =>
              !excludedStatuses.contains(order.orderStatus.toUpperCase()),
        )
        .toList();
  }

  //!
  // List<OrderData> _fetchNewOrders(List<OrderData> allOrders) {
  //   return allOrders.where((e) => e.orderStatus.isCancellable).toList();
  // }
}
