part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(FormzSubmissionStatus.inProgress) FormzSubmissionStatus formzStatus,
    @Default(null) UserModel? user,
}) = _SplashState;

  const SplashState._();
}
