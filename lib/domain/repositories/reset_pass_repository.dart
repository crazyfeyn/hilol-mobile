import 'package:commerce_mobile/data/models/reset_pass_param_model.dart';
import 'package:commerce_mobile/data/models/reset_pass_token_model.dart';
import 'package:dartz/dartz.dart';

abstract class ResetPassRepository {
  Future<Either<String, ResetPassTokenModel>> resetPassword(
    ResetPassRepositoryParam resetPassParam,
  );

  void dispose();
}
