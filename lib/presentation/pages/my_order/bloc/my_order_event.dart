part of 'my_order_bloc.dart';

abstract class MyOrderEvent {}

class MyOrderFetchData extends MyOrderEvent {}

class MyOrderCancel extends MyOrderEvent {
  final int id;

  MyOrderCancel(this.id);
}

class MyOrderDispose extends MyOrderEvent {}