part of 'details_bloc.dart';

abstract class DetailsEvent {}

class DetailsEnsureInitial extends DetailsEvent {
  final bool isAdd;

  DetailsEnsureInitial(this.isAdd);
}

class DetailsAddProduct extends DetailsEvent {}

class DetailsRemoveProduct extends DetailsEvent {}