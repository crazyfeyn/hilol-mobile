// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/data/models/auth_model.dart';
import 'package:commerce_mobile/data/repositories/auth_repository_impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final _repository = AuthRepositoryImpl();

  SignUpBloc() : super(const SignUpState()) {
    on<SignUpChangeObscureText1>((event, emit) {
      emit(state.copyWith(obscureText1: !state.obscureText1));
    });

    on<SignUpChangeObscureText2>((event, emit) {
      emit(state.copyWith(obscureText2: !state.obscureText2));
    });

    on<SignUpSendData>((event, emit) async {
      FormzSubmissionStatus formzStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(formzStatus: formzStatus, auth: event.auth));

      String? clientId;
      final result = await _repository.signUp(event.auth);
      if (result.isRight()) {
        clientId = result.getOrElse(() => throw Exception("Unexpected error"));
        formzStatus = FormzSubmissionStatus.success;
      } else {
        formzStatus = FormzSubmissionStatus.failure;
      }

      emit(state.copyWith(formzStatus: formzStatus, clientId: clientId));
    });

    on<SignUpDispose>((event, emit) => _repository.dispose());
  }
}
