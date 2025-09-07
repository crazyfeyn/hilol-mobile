import 'package:commerce_mobile/core/error/failure.dart';
import 'package:commerce_mobile/presentation/pages/auth/data/datasources/auth_datasources.dart';
import 'package:commerce_mobile/presentation/pages/auth/data/models/register_user_model.dart';
import 'package:commerce_mobile/presentation/pages/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoriesImpl extends AuthRepositories {
  AuthDatasources authDatasources;

  AuthRepositoriesImpl({required this.authDatasources});

  @override
  Future<Either<Failure, void>> register(
    RegisterUserModel registerUserModel,
  ) async {
    try {
      return Right(await authDatasources.register(registerUserModel));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
