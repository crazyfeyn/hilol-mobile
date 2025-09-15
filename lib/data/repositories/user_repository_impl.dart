import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/data/datasources/network/cancel_token_manager.dart';
import 'package:commerce_mobile/data/datasources/network/network_helper.dart';
import 'package:commerce_mobile/data/datasources/network/network_service.dart';
import 'package:commerce_mobile/data/models/user_model.dart';
import 'package:commerce_mobile/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart' as context;

class UserRepositoryImpl extends UserRepository {
  late final CancelTokenManager cancelTokenManager;

  UserRepositoryImpl() {
    cancelTokenManager = CancelTokenManager();
  }

  @override
  Future<Either<String, UserModel>> fetchUserData() async {
    try {
      final localUser = DBService.getUserData();
      if (localUser != null) {
        print('yutdik, yutdik, yyutdik');
        print('[][][][][][]');
        print(localUser.fullName);
        return Right(localUser);
      }
      print('ikkonchi');
      print('ikkonchi bir');
      final api = NetworkService.apiGetUser;
      final cancelToken = cancelTokenManager.getToken(api);
      final response = await NetworkService.get(api, cancelToken);

      if (response['success'] == true && response['data'] != null) {
        print("ikkinchidan success");
        final userData = UserModel.fromJson(response['data']);
        await DBService.setUserData(userData);
        return Right(userData);
      }
      print('oxshamadi');
      print('p[[p[p[opoksdfvjkbdgfkjdjkfgjkdfhbg]]]]');

      return Left(context.tr(LocaleKeys.user_not_found));
    } on NetworkException catch (e) {
      if (e.type != NetworkExceptionType.cancelled) {
        //! Handle network errors
      }
      return Left(e.message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> logout() async {
    try {
      final result = await DBService.logOut();
      if (result) {
        return const Right(true);
      }
      return const Left("Logout failed");
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  void dispose() => cancelTokenManager.cancelAll();
}
