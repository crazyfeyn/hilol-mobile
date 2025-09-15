// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/data/models/user_model.dart';
import 'package:commerce_mobile/data/repositories/user_repository_impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final _repository = UserRepositoryImpl();

  UserBloc() : super(const UserState()) {
    on<UserFetchData>((event, emit) async {
      FormzSubmissionStatus formzStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(formzStatus: formzStatus));

      UserModel? user;
      final result = await _repository.fetchUserData();
      if (result.isRight()) {
        user = result.getOrElse(() => throw Exception("Unexpected error"));
        formzStatus = FormzSubmissionStatus.success;
      } else {
        formzStatus = FormzSubmissionStatus.failure;
      }
      emit(state.copyWith(formzStatus: formzStatus, user: user));
    });

    on<UserResetStatus>((event, emit) {
      emit(state.copyWith(formzStatus: FormzSubmissionStatus.initial));
    });

    on<UserDispose>((event, emit) => _repository.dispose());
    on<UserLogout>((event, emit) => _repository.logout());
  }
}
