part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class SignUpChangeObscureText1 extends SignUpEvent {}

class SignUpChangeObscureText2 extends SignUpEvent {}

class SignUpSendData extends SignUpEvent {
  AuthModel auth;

  SignUpSendData(this.auth);
}

class SignUpDispose extends SignUpEvent {}
