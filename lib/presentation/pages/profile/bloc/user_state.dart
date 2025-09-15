part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus formzStatus,
    UserModel? user,
  }) = _UserState;
}
