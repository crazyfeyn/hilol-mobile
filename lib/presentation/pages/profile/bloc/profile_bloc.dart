import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/core/services/session_service.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/data/models/user_model.dart';
import 'package:commerce_mobile/data/repositories/user_repository_impl.dart';
import 'package:easy_localization/easy_localization.dart' as context;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _repository = UserRepositoryImpl();

  ProfileBloc() : super(const ProfileState()) {
    on<ProfileFetchData>((event, emit) async {
      UserModel? user = DBService.getUserData();
      emit(
        state.copyWith(user: user, formzStatus: FormzSubmissionStatus.success),
      );
    });

    on<ProfileEditData>((event, emit) async {
      FormzSubmissionStatus formzStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(formzStatus: formzStatus));

      UserModel? user = DBService.getUserData();
      final result = await _repository.fetchUserData();
      if (result.isRight()) {
        user = result.getOrElse(
          () => throw Exception(context.tr(LocaleKeys.unexpected_error)),
        );
        formzStatus = FormzSubmissionStatus.success;
      } else {
        formzStatus = FormzSubmissionStatus.failure;
      }

      emit(state.copyWith(user: user, formzStatus: formzStatus));
    });

    on<ProfileLogOut>((event, emit) async {
      FormzSubmissionStatus logoutStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(logoutStatus: logoutStatus));

      final result = await _repository.logout();
      if (result.isRight()) {
        final res = result.getOrElse(
          () => throw Exception(context.tr(LocaleKeys.unexpected_error)),
        );
        if (res) {
          SessionService.setAuthenticated(false);
          logoutStatus = FormzSubmissionStatus.success;
        } else {
          logoutStatus = FormzSubmissionStatus.canceled;
        }
      } else {
        logoutStatus = FormzSubmissionStatus.failure;
      }

      emit(state.copyWith(logoutStatus: logoutStatus));
    });

    on<ProfileDelete>((event, emit) async {
      FormzSubmissionStatus deleteStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(deleteStatus: deleteStatus));

      final result = await _repository.deleteAccount();

      if (result.isRight()) {
        final res = result.getOrElse(
          () => throw Exception(context.tr(LocaleKeys.unexpected_error)),
        );
        if (res) {
          // Successfully deleted account
          deleteStatus = FormzSubmissionStatus.success;
          // Clear user data from local storage
          await DBService.logOut();
          SessionService.setAuthenticated(false);
          emit(state.copyWith(deleteStatus: deleteStatus, user: null));
        } else {
          deleteStatus = FormzSubmissionStatus.canceled;
          emit(state.copyWith(deleteStatus: deleteStatus));
        }
      } else {
        deleteStatus = FormzSubmissionStatus.failure;
        emit(state.copyWith(deleteStatus: deleteStatus));
      }
    });

    on<ProfileDispose>((event, emit) async {
      _repository.dispose();
      emit(
        state.copyWith(
          user: null,
          formzStatus: FormzSubmissionStatus.initial,
          logoutStatus: FormzSubmissionStatus.initial,
          deleteStatus: FormzSubmissionStatus.initial,
        ),
      );
    });
  }
}
