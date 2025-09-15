part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.fetchData() = UserFetchData;
  const factory UserEvent.logout() = UserLogout;
  const factory UserEvent.resetStatus() = UserResetStatus;
  const factory UserEvent.dispose() = UserDispose;
}
