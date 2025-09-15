import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/data/datasources/network/cancel_token_manager.dart';
import 'package:commerce_mobile/data/datasources/network/network_helper.dart';
import 'package:commerce_mobile/data/datasources/network/network_service.dart';
import 'package:commerce_mobile/data/models/reset_pass_param_model.dart';
import 'package:commerce_mobile/data/models/reset_pass_token_model.dart';
import 'package:commerce_mobile/domain/repositories/reset_pass_repository.dart';
import 'package:dartz/dartz.dart';

class ResetPassRepositoryImpl extends ResetPassRepository {
  late final CancelTokenManager cancelTokenManager;

  ResetPassRepositoryImpl() {
    cancelTokenManager = CancelTokenManager();
  }

  @override
  void dispose() => cancelTokenManager.cancelAll();

  @override
  Future<Either<String, ResetPassTokenModel>> resetPassword(
    ResetPassRepositoryParam resetPassParam,
  ) async {
    try {
      final api = NetworkService.apiResetPass;
      final cancelToken = cancelTokenManager.getToken(api);
      final response = await NetworkService.post(
        api,
        cancelToken,
        resetPassParam.toJson(),
      );
      final result = ResetPassTokenModel(
        refreshToken: response['data']['refreshToken'],
        accessToken: response['data']['accessToken'],
      );
      DBService.clearTokens();
      await DBService.setAccessToken(result.accessToken);
      await DBService.setRefreshToken(result.refreshToken);
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
}
