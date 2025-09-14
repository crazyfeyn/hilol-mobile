part of 'reset_pass_bloc.dart';

@freezed
class ResetPassEvent with _$ResetPassEvent {
  const factory ResetPassEvent.sendData(
    ResetPassRepositoryParam resetPassParam,
  ) = ResetPassSendData;
  const factory ResetPassEvent.resetStatus() = ResetPassResetStatus;
  const factory ResetPassEvent.dispose() = ResetPassDispose;
}
