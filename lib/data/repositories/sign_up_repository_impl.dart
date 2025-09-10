import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:commerce_mobile/data/datasources/network/cancel_token_manager.dart';
import 'package:commerce_mobile/data/datasources/network/network_helper.dart';
import 'package:commerce_mobile/data/datasources/network/network_service.dart';
import 'package:commerce_mobile/data/models/sign_up_model.dart';
import 'package:commerce_mobile/domain/repositories/sign_up_repository.dart';
import 'package:dartz/dartz.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  late final CancelTokenManager cancelTokenManager;

  SignUpRepositoryImpl() {
    cancelTokenManager = CancelTokenManager();
  }

  @override
  void dispose() => cancelTokenManager.cancelAll();

  @override
  Future<Either<String, String>> signUp(SignUpModel auth) async {
    try {
      final api = NetworkService.apiAuthSignUp;
      final cancelToken = cancelTokenManager.getToken(api);
      final response = await NetworkService.post(
        api,
        cancelToken,
        auth.toJson(),
      );
      final result = response['data']['clientId'];
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
