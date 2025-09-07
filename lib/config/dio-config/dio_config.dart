// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:commerce_mobile/core/error/failure.dart';
import 'package:commerce_mobile/core/utils/app_constants.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:dio/dio.dart';

class DioConfig {
  late final Dio _dio;
  final DBService dbService;

  DioConfig(this.dbService) {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(DioInterceptor(dbService: dbService));
  }

  Dio get client => _dio;
}

class DioInterceptor extends Interceptor {
  DBService dbService;

  DioInterceptor({required this.dbService});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = DBService.getAccessToken();
      log('🟡 [REQUEST]');
      log('➡️ URL: ${options.baseUrl}${options.path}');
      log('➡️ METHOD: ${options.method}');
      log('➡️ HEADERS: ${options.headers}');
      log('➡️ BODY: ${options.data}');

      if (token.isNotEmpty) {
        options.headers['Authorization'] = token;
        log('🔐 Token attached: $token');
      }
    } catch (e) {
      log('❌ Token error: $e');
      throw ServerFailure(message: e.toString());
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('🟢 [RESPONSE]');
    log(
      '⬅️ URL: ${response.requestOptions.baseUrl}${response.requestOptions.path}',
    );
    log('⬅️ STATUS: ${response.statusCode}');
    log('⬅️ DATA: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log('🔴 [ERROR]');
    log('❗ URL: ${err.requestOptions.baseUrl}${err.requestOptions.path}');
    log('❗ TYPE: ${err.type}');
    log('❗ MESSAGE: ${err.message}');
    log('❗ DATA: ${err.response?.data}');

    if (err.type == DioExceptionType.connectionError) {
      log('🚫 Нет подключения к интернету');
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: 'Нет подключения к интернету',
          type: DioExceptionType.connectionError,
        ),
      );
    } else if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      log('⏰ Сервер не отвечает');
      throw NetworkFailure();
    } else if (err.response?.statusCode == 401) {
      log('🔐 401 Unauthorized – пробуем получить новый токен');
      try {
        final newToken = DBService.getAccessToken();
        if (newToken.isNotEmpty) {
          err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
          log('🔁 Новый токен добавлен: $newToken');
        }
      } catch (e) {
        log('❌ Ошибка при обновлении токена: $e');
        return handler.next(err);
      }
    }

    handler.next(err);
  }
}
