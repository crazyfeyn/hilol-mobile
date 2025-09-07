import 'package:commerce_mobile/config/dio-config/dio_config.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:commerce_mobile/presentation/pages/auth/data/datasources/auth_datasources.dart';
import 'package:commerce_mobile/presentation/pages/auth/data/repositories/auth_repositories.dart';
import 'package:commerce_mobile/presentation/pages/auth/domain/usecases/register_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.asNewInstance();
Future<void> init() async {
  final shared = await SharedPreferences.getInstance();

  // 1️⃣ Register DBService first
  sl.registerLazySingleton<DBService>(() => DBService());

  // 2️⃣ Now you can safely use it
  final client = DioConfig(sl<DBService>()).client;

  // 3️⃣ Register the rest
  sl.registerFactory(() => AuthDatasources(dio: Dio()));
  sl.registerFactory(
    () => AuthRepositoriesImpl(authDatasources: sl<AuthDatasources>()),
  );
  sl.registerFactory(
    () => RegisterUsecase(repository: sl<AuthRepositoriesImpl>()),
  );
  sl.registerFactory(() => AuthBloc(sl<RegisterUsecase>()));
}
