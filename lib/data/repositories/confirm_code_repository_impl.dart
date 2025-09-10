import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:commerce_mobile/data/datasources/network/cancel_token_manager.dart';
import 'package:commerce_mobile/data/datasources/network/network_helper.dart';
import 'package:commerce_mobile/data/datasources/network/network_service.dart';
import 'package:commerce_mobile/data/models/confirm_code_model.dart';
import 'package:commerce_mobile/domain/repositories/confirm_code_repository.dart';
import 'package:commerce_mobile/domain/repositories/sign_in_repository.dart';
import 'package:dartz/dartz.dart';

class ConfirmCodeRepositoryImpl extends ConfirmCodeRepository {
  late final CancelTokenManager cancelTokenManager;

  ConfirmCodeRepositoryImpl() {
    cancelTokenManager = CancelTokenManager();
  }

  @override
  void dispose() => cancelTokenManager.cancelAll();

  @override
  Future<Either<String, SignInParam>> confirmCode(
    ConfirmCodeModel confirmCodeModel,
  ) async {
    try {
      final api = NetworkService.apiAuthConfirmPass;
      final cancelToken = cancelTokenManager.getToken(api);
      final response = await NetworkService.post(
        api,
        cancelToken,
        confirmCodeModel.toJson(),
      );
      final result = SignInParam(
        refreshToken: response['data']['refreshToken'],
        accessToken: response['data']['accessToken'],
      );
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
