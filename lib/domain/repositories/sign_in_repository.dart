import 'package:commerce_mobile/data/models/sign_in_model.dart';
import 'package:dartz/dartz.dart';

abstract class SignInRepository {
  Future<Either<String, SignInParam>> signIn(SignInModel auth);

  void dispose();
}

class SignInParam {
  String refreshToken;
  String accessToken;

  SignInParam({required this.refreshToken, required this.accessToken});
}
