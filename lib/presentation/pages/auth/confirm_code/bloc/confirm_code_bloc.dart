// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/confirm_code_model.dart';
import 'package:commerce_mobile/data/repositories/confirm_code_repository_impl.dart';
import 'package:commerce_mobile/domain/repositories/sign_in_repository.dart';
import 'package:easy_localization/easy_localization.dart' as context;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'confirm_code_event.dart';
part 'confirm_code_state.dart';
part 'confirm_code_bloc.freezed.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState> {
  final _repository = ConfirmCodeRepositoryImpl();

  ConfirmCodeBloc() : super(const ConfirmCodeState()) {
    on<ConfirmCodeSendData>((event, emit) async {
      FormzSubmissionStatus formzStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(formzStatus: formzStatus));

      SignInParam? auth;
      final result = await _repository.confirmCode(event.confirmCodeModel);
      if (result.isRight()) {
        auth = result.getOrElse(
          () => throw Exception(context.tr(LocaleKeys.unexpected_error)),
        );
        formzStatus = FormzSubmissionStatus.success;
      } else {
        formzStatus = FormzSubmissionStatus.failure;
      }
      emit(state.copyWith(formzStatus: formzStatus, auth: auth));
    });

    on<ConfirmCodeResetStatus>((event, emit) {
      emit(state.copyWith(formzStatus: FormzSubmissionStatus.initial));
    });

    on<ConfirmCodeDispose>((event, emit) => _repository.dispose());
  }
}
