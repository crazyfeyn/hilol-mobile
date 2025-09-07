import 'package:bloc/bloc.dart';
import 'package:commerce_mobile/core/error/failure.dart';
import 'package:commerce_mobile/core/utils/app_constants.dart';
import 'package:commerce_mobile/presentation/pages/auth/data/models/register_user_model.dart';
import 'package:commerce_mobile/presentation/pages/auth/domain/usecases/register_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_events.dart';
part 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  RegisterUsecase registerUsecase;

  AuthBloc(this.registerUsecase) : super(AuthStates()) {
    on<_RegisterEvent>(_register);
  }

  Future<void> _register(_RegisterEvent event, Emitter<AuthStates> emit) async {
    emit(state.copyWith(status: Status.loading));

    final response = await registerUsecase(event.registerUserModel);
    response.fold(
      (error) {
        if (error is NetworkFailure) {
          emit(state.copyWith(status: Status.errorNetwork));
        } else {
          emit(state.copyWith(status: Status.error, message: state.message));
        }
      },
      (data) {
        emit(state.copyWith(status: Status.success));
      },
    );
  }
}
