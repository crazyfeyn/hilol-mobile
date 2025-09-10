part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus formzStatus,
    @Default(null) SignInParam? auth,

    @Default(true) bool obscureText,
  }) = _SignInState;

  const SignInState._();
}
