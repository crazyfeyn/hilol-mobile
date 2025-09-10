import 'package:commerce_mobile/data/models/confirm_code_model.dart';
import 'package:commerce_mobile/domain/repositories/sign_in_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ConfirmCodeRepository {
  Future<Either<String, SignInParam>> confirmCode(
    ConfirmCodeModel confirmCodeModel,
  );

  void dispose();
}
