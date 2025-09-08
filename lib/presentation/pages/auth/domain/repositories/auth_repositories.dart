import 'package:commerce_mobile/core/error/failure.dart';
import 'package:commerce_mobile/presentation/pages/auth/data/models/register_user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepositories {
  Future<Either<Failure, void>> register(RegisterUserModel registerUserModel);
}
