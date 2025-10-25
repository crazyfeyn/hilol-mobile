part of 'details_bloc.dart';

@freezed
class DetailsState with _$DetailsState {
  const factory DetailsState({
    @Default(FormzSubmissionStatus.inProgress) FormzSubmissionStatus formzStatus,
    @Default(null) CartModel? cart,
    required ProductModel product,
}) = _DetailsState;

  const DetailsState._();
}
