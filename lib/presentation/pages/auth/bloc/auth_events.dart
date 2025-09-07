part of 'auth_bloc.dart';

@freezed
abstract class AuthEvents with _$AuthEvents {
  const factory AuthEvents.register({
    required RegisterUserModel registerUserModel,
  }) = _RegisterEvent;
}
