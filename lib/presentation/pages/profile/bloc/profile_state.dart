part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus formzStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus logoutStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus deleteStatus,
    @Default(null) UserModel? user,
}) = _ProfileState;

  const ProfileState._();
}
