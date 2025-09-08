part of 'auth_bloc.dart';

@freezed
abstract class AuthStates with _$AuthStates {
  factory AuthStates({
    @Default(Status.initial) Status status,
    String? message,
  }) = _AuthStates;
}
