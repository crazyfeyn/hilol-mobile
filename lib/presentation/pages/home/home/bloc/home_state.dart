part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus formzStatus,
    @Default([]) List<ProductModel> products,
    ProductModel? product,
  }) = _HomeState;
}
