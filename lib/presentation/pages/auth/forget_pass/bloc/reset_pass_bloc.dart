// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/data/models/reset_pass_param_model.dart';
import 'package:commerce_mobile/data/models/reset_pass_token_model.dart';
import 'package:commerce_mobile/data/repositories/reset_pass_repository_impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_pass_event.dart';
part 'reset_pass_state.dart';
part 'reset_pass_bloc.freezed.dart';

class ResetPassBloc extends Bloc<ResetPassEvent, ResetPassState> {
  final _repository = ResetPassRepositoryImpl();

  ResetPassBloc() : super(const ResetPassState()) {
    on<ResetPassSendData>((event, emit) async {
      FormzSubmissionStatus formzStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(formzStatus: formzStatus));

      ResetPassTokenModel? resetPassToken;
      final result = await _repository.resetPassword(event.resetPassParam);
      if (result.isRight()) {
        resetPassToken = result.getOrElse(
          () => throw Exception("Unexpected error"),
        );
        formzStatus = FormzSubmissionStatus.success;
      } else {
        formzStatus = FormzSubmissionStatus.failure;
      }
      emit(
        state.copyWith(
          formzStatus: formzStatus,
          resetPassToken: resetPassToken,
        ),
      );
    });

    on<ResetPassResetStatus>((event, emit) {
      emit(state.copyWith(formzStatus: FormzSubmissionStatus.initial));
    });

    on<ResetPassDispose>((event, emit) => _repository.dispose());
  }
}
