part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus formzStatus,
    @Default(null) AuthModel? auth,
    @Default(null) String? clientId,

    @Default(true) bool obscureText1,
    @Default(true) bool obscureText2,
}) = _SignUpState;

  const SignUpState._();
}
