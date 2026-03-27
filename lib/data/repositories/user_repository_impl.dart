import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/data/datasources/network/cancel_token_manager.dart';
import 'package:commerce_mobile/data/datasources/network/network_helper.dart';
import 'package:commerce_mobile/data/datasources/network/network_service.dart';
import 'package:commerce_mobile/data/models/user_model.dart';
import 'package:commerce_mobile/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl extends UserRepository {
  late final CancelTokenManager cancelTokenManager;

  UserRepositoryImpl() {
    cancelTokenManager = CancelTokenManager();
  }

  @override
  Future<Either<String, UserModel>> fetchUserData() async {
    try {
      final api = NetworkService.apiGetUser;
      final cancelToken = cancelTokenManager.getToken(api);
      final response = await NetworkService.get(api, cancelToken);

      final userData = UserModel.fromJson(response['data']);
      await DBService.setUserData(userData);
      return Right(userData);
    } on NetworkException catch (e) {
      if (e.type != NetworkExceptionType.cancelled) {
        GlobalSnackBar.showError(e.message);
      }
      return Left(e.message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> uploadImage(String path) async {
    try {
      final api = NetworkService.apiUserUploadImage;
      final cancelToken = cancelTokenManager.getToken(api);
      String fileName = path.split('/').last;
      final image = await MultipartFile.fromFile(
        path,
        filename: fileName,
        contentType: DioMediaType("image", "png"),
      );
      final response = await NetworkService.post(
        api,
        cancelToken,
        NetworkService.paramsUserUploadImage(image),
      );
      final result = response["success"];
      return Right(result);
    } on NetworkException catch (e) {
      if (e.type != NetworkExceptionType.cancelled) {
        GlobalSnackBar.showError(e.message);
      }
      return Left(e.message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> updateUserInfo(
    String firstname,
    String lastname,
  ) async {
    try {
      final api = NetworkService.apiUserUpdateUserInfo;
      final cancelToken = cancelTokenManager.getToken(api);
      final response = await NetworkService.put(
        api,
        cancelToken,
        NetworkService.paramsUserInfo(firstname, lastname),
      );
      final result = response["success"];
      return Right(result);
    } on NetworkException catch (e) {
      if (e.type != NetworkExceptionType.cancelled) {
        GlobalSnackBar.showError(e.message);
      }
      return Left(e.message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> deleteAccount() async {
    try {
      final api = NetworkService.apiUserDeleteAccount;
      final cancelToken = cancelTokenManager.getToken(api);
      final response = await NetworkService.delete(api, cancelToken);
      final result = response["success"];
      return Right(result);
    } on NetworkException catch (e) {
      if (e.type != NetworkExceptionType.cancelled) {
        GlobalSnackBar.showError(e.message);
      }
      return Left(e.message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> logout() async {
    try {
      final result = await DBService.logOut();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> onRefreshToken(
    String clientId,
    String refreshToken,
  ) async {
    try {
      final api = NetworkService.apiRefreshToken;
      final cancelToken = cancelTokenManager.getToken(api);
      final response = await NetworkService.post(
        api,
        cancelToken,
        NetworkService.paramsRefreshToken(clientId, refreshToken),
      );

      DBService.setRefreshToken(response["data"]["refreshToken"]);
      DBService.setAccessToken(response["data"]["accessToken"]);
      final result = response['success'];
      return Right(result);
    } on NetworkException catch (e) {
      if (e.type != NetworkExceptionType.cancelled) {
        GlobalSnackBar.showError(e.message);
      }
      return Left(e.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  void dispose() => cancelTokenManager.cancelAll();
}
