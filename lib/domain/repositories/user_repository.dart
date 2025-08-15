import 'package:commerce_mobile/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<String, UserModel>> fetchUserData();

  void dispose();
}