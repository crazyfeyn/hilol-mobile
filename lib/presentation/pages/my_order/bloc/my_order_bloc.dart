import 'package:commerce_mobile/core/extension/extensions.dart';
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
      FormzSubmissionStatus formzStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(formzStatus: formzStatus));

      List<OrderData> allOrders = [];
      final result = await _repository.fetchMyOrders();
      if(result.isRight()) {
        allOrders = result.getOrElse(() => throw Exception("Unexpected error"));
        formzStatus = FormzSubmissionStatus.success;
      } else {
        formzStatus = FormzSubmissionStatus.failure;
      }

      emit(state.copyWith(allOrders: allOrders, newOrders: _fetchNewOrders(allOrders), formzStatus: formzStatus));
    });

    on<MyOrderCancel>((event, emit) async {
      emit(state.copyWith(formzStatus: FormzSubmissionStatus.inProgress));

      final result = await _repository.cancelMyOrder(event.id);
      if(result.isRight()) {
        final res = result.getOrElse(() => throw Exception("Unexpected error"));
        if(res) {
          add(MyOrderFetchData());
        } else {
          emit(state.copyWith(formzStatus: FormzSubmissionStatus.canceled));
        }
      } else {
        emit(state.copyWith(formzStatus: FormzSubmissionStatus.failure));
      }
    });

    on<MyOrderDispose>((event, emit) => _repository.dispose());
  }

  List<OrderData> _fetchNewOrders(List<OrderData> allOrders) {
    return allOrders.where((e) => e.orderStatus.checkingOrderStatusPay).toList();
  }
}
