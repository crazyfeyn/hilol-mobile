part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class SignInChangeObscureText extends SignInEvent {}

class SignInSendData extends SignInEvent {
  SignInModel auth;

  SignInSendData(this.auth);
}

class SignInDispose extends SignInEvent {}
