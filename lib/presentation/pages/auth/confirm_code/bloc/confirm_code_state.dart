part of 'confirm_code_bloc.dart';

@freezed
class ConfirmCodeState with _$ConfirmCodeState {
  const factory ConfirmCodeState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus formzStatus,
    @Default(null) SignInParam? auth,
  }) = _ConfirmCodeState;

  const ConfirmCodeState._();
}
