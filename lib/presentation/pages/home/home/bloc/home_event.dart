part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeFetchBanners extends HomeEvent {}

class HomeFetchCategories extends HomeEvent {}

class HomeFetchProducts extends HomeEvent {
  final int? categoryId;

  HomeFetchProducts(this.categoryId);
}

class HomeSearchProducts extends HomeEvent {
  final String text;

  HomeSearchProducts(this.text);
}


class HomeDispose extends HomeEvent {}
