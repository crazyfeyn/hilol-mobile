part of 'cart_bloc.dart';

abstract class CartEvent {}

class CartFetchAllCarts extends CartEvent {}

class CartAddCountById extends CartEvent {
  final int? id;

  CartAddCountById(this.id);
}

class CartRemoveCountById extends CartEvent {
  final int? id;

  CartRemoveCountById(this.id);
}

class CartDeleteById extends CartEvent {
  final int? id;

  CartDeleteById(this.id);
}

class CartDeleteAllCarts extends CartEvent {}