part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeFetchBanners extends HomeEvent {}

class HomeFetchCategories extends HomeEvent {}

/// Force refresh for double-tap reselection on Home tab.
/// Always fetches categories + all products, then updates the in-memory cache.
class HomeRefreshAll extends HomeEvent {}

class HomeFetchProducts extends HomeEvent {
  final int? categoryId;

  HomeFetchProducts(this.categoryId);
}

class HomeSearchProducts extends HomeEvent {
  final String text;

  HomeSearchProducts(this.text);
}


class HomeDispose extends HomeEvent {}
