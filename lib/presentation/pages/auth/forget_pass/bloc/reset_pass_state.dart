part of 'reset_pass_bloc.dart';

@freezed
class ResetPassState with _$ResetPassState {
  const factory ResetPassState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus formzStatus,
    ResetPassTokenModel? resetPassToken,
  }) = _ResetPassState;
}
