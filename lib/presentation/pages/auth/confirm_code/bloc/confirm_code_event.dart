part of 'confirm_code_bloc.dart';

abstract class ConfirmCodeEvent {}

class ConfirmCodeSendData extends ConfirmCodeEvent {
  ConfirmCodeModel confirmCodeModel;

  ConfirmCodeSendData(this.confirmCodeModel);
}

class ConfirmCodeResetStatus extends ConfirmCodeEvent {}

class ConfirmCodeDispose extends ConfirmCodeEvent {}
