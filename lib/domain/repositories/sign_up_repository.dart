import 'package:commerce_mobile/data/models/sign_up_model.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpRepository {
  Future<Either<String, String>> signUp(SignUpModel auth);

  void dispose();
}
