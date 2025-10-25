import 'package:commerce_mobile/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<String, UserModel>> fetchUserData();

  Future<Either<String, bool>> uploadImage(String path);

  Future<Either<String, bool>> updateUserInfo(String firstname, String lastname);

  Future<Either<String, bool>> deleteAccount();

  Future<Either<String, bool>> logout();

  Future<Either<String, bool>> onRefreshToken(String clientId, String refreshToken);

  void dispose();
}
