// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/sign_in_model.dart';
import 'package:commerce_mobile/data/repositories/sign_in_repository_impl.dart';
import 'package:commerce_mobile/data/repositories/user_repository_impl.dart';
import 'package:commerce_mobile/domain/repositories/sign_in_repository.dart';
import 'package:easy_localization/easy_localization.dart' as context;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final _repository = SignInRepositoryImpl();
  final _userRepository = UserRepositoryImpl();

  SignInBloc() : super(const SignInState()) {
    on<SignInChangeObscureText>((event, emit) {
      emit(state.copyWith(obscureText: !state.obscureText));
    });

    on<SignInSendData>((event, emit) async {
      FormzSubmissionStatus formzStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(formzStatus: formzStatus));

      SignInParam? auth;
      final result = await _repository.signIn(event.auth);
      await _userRepository.fetchUserData();
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

    on<SignInDispose>((event, emit) => _repository.dispose());
  }
}
