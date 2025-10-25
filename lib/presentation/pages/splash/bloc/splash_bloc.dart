import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/data/models/user_model.dart';
import 'package:commerce_mobile/data/repositories/user_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final _repository = UserRepositoryImpl();

  SplashBloc() : super(const SplashState()) {
    on<SplashFetchUserData>((event, emit) async {
      FormzSubmissionStatus formzStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(formzStatus: formzStatus));

      UserModel? user = DBService.getUserData();
      if(user != null) {
        await Future.delayed(Duration(seconds: 2));
        formzStatus = FormzSubmissionStatus.success;
      } else {
        final result = await _repository.fetchUserData();
        if(result.isRight()) {
          user = result.getOrElse(() => throw Exception("Unexpected error"));
          formzStatus = FormzSubmissionStatus.success;
        } else {
          formzStatus = FormzSubmissionStatus.failure;
        }
      }

      emit(state.copyWith(user: user, formzStatus: formzStatus));
    });

    on<SplashDispose>((event, state) => _repository.dispose());
  }
}
