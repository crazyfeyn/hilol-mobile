import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/data/datasources/network/cancel_token_manager.dart';
import 'package:commerce_mobile/data/datasources/network/network_helper.dart';
import 'package:commerce_mobile/data/datasources/network/network_service.dart';
import 'package:commerce_mobile/data/models/sign_in_model.dart';
import 'package:commerce_mobile/data/models/user_model.dart';
import 'package:commerce_mobile/domain/repositories/sign_in_repository.dart';
import 'package:dartz/dartz.dart';

class SignInRepositoryImpl extends SignInRepository {
  late final CancelTokenManager cancelTokenManager;

  SignInRepositoryImpl() {
    cancelTokenManager = CancelTokenManager();
  }

  @override
  void dispose() => cancelTokenManager.cancelAll();

  @override
  Future<Either<String, SignInParam>> signIn(SignInModel auth) async {
    try {
      final api = NetworkService.apiAuthSignIn;
      final cancelToken = cancelTokenManager.getToken(api);
      final response = await NetworkService.post(
        api,
        cancelToken,
        auth.toJson(),
      );
      final result = SignInParam(
        refreshToken: response['data']['refreshToken'],
        accessToken: response['data']['accessToken'],
      );
      await DBService.setAccessToken(result.accessToken);
      await DBService.setRefreshToken(result.refreshToken);

      if (response['data']['user'] != null) {
        final userData = UserModel.fromJson(response['data']['user']);
        await DBService.setUserData(userData);
      }
      if ((response['data']['clientId'] as String?)?.isNotEmpty == true) {
        await DBService.setClientId(response['data']['clientId'] as String);
      }
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
}
