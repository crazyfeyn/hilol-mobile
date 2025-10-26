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
      
      // Check if user is logged in (has valid token)
      bool isLoggedIn = DBService.isLoggedIn();
      
      if(user != null && isLoggedIn) {
        // User exists and is logged in, just add delay for splash screen
        await Future.delayed(Duration(seconds: 2));
        formzStatus = FormzSubmissionStatus.success;
      } else if(isLoggedIn && user == null) {
        // User is logged in but no user data, try to fetch from API
        final result = await _repository.fetchUserData();
        if(result.isRight()) {
          user = result.getOrElse(() => throw Exception("Unexpected error"));
          formzStatus = FormzSubmissionStatus.success;
        } else {
          // If fetch fails, user is not properly authenticated, clear tokens
          await DBService.logOut();
          formzStatus = FormzSubmissionStatus.failure;
        }
      } else {
        // User is not logged in (new user or logged out), don't make API calls
        await Future.delayed(Duration(seconds: 2));
        formzStatus = FormzSubmissionStatus.success;
      }

      emit(state.copyWith(user: user, formzStatus: formzStatus));
    });

    on<SplashDispose>((event, state) => _repository.dispose());
  }
}
