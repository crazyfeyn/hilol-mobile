import 'package:commerce_mobile/core/error/failure.dart';
import 'package:commerce_mobile/core/usecases/usecase.dart';
import 'package:commerce_mobile/presentation/pages/auth/data/models/register_user_model.dart';
import 'package:commerce_mobile/presentation/pages/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class RegisterUsecase extends Usecase<void, RegisterUserModel> {
  AuthRepositories repository;
  RegisterUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(RegisterUserModel params) {
    return repository.register(params);
  }
}
