import 'package:commerce_mobile/data/models/auth_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<String, String>> signUp(AuthModel auth);

  void dispose();
}