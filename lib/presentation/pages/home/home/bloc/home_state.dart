part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(FormzSubmissionStatus.inProgress) FormzSubmissionStatus bannerStatus,

    @Default(FormzSubmissionStatus.inProgress) FormzSubmissionStatus categoryStatus,
    @Default([]) List<ProductCategoryModel> categories,
    @Default(null) int? selectCategoryId,

    @Default(FormzSubmissionStatus.inProgress) FormzSubmissionStatus productStatus,
    @Default([]) List<ProductModel> products,
}) = _HomeState;

  const HomeState._();
}
