part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchAllProducts() = HomeFetchAllProducts;
  const factory HomeEvent.fetchProductByCategory(int categoryId) =
      HomeFetchProductByCategory;
  const factory HomeEvent.fetchProductById(int productId) =
      HomeFetchProductById;
  const factory HomeEvent.resetStatus() = HomeResetStatus;
  const factory HomeEvent.dispose() = HomeDispose;
}
