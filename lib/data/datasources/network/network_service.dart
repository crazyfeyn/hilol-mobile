import 'dart:io';

import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:commerce_mobile/core/services/lang_service.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/data/datasources/network/network_helper.dart';
import 'package:dio/dio.dart';

class NetworkService {
  static bool _isTester = true;
  static final _serverDev = "";
  static final _serverProd = "";

  static String get getService {
    if (_isTester) return _serverDev;
    return _serverProd;
  }

  static Map<String, String> get getHeaders {
    final langCode = LangService.currentLocale;
    final accessToken = DBService.getAccessToken();
    return {
      "X-Client-Type": "Hisobchi-APP",
      "token": accessToken,
      "Accept-Language": langCode,
    };
  }

  static Dio get _dio {
    return Dio(BaseOptions(baseUrl: getService, headers: getHeaders))
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true))
      ..interceptors.add(NetworkInterceptor());
  }

  /* Http Requests */
  static Future<T?> get<T>(String api, CancelToken cancelToken, [Map<String, dynamic>? params]) async {
    try {
      var response = await _dio.get(api, queryParameters: params, cancelToken: cancelToken);
      return response.data;
    } on DioException catch (e) {
      final error = NetworkException.fromDioError(e);
      if(error.type != NetworkExceptionType.cancelled) {
        GlobalSnackBar.showError(error.message);
      }
      throw NetworkException.fromDioError(e);
    } on SocketException catch (e) {
      GlobalSnackBar.showError("");
      throw NetworkException("No internet connection: ${e.message}", NetworkExceptionType.noInternet,);
    } catch (e) {
      GlobalSnackBar.showError("");
      throw NetworkException("An unexpected error occurred: $e", NetworkExceptionType.unknown,);
    }
  }

  static Future<T?> post<T>(String api, CancelToken cancelToken, [Object? data, Map<String, dynamic>? params]) async {
    try {
      var response = await _dio.post(api, data: data, queryParameters: params, cancelToken: cancelToken);
      return response.data;
    } on DioException catch (e) {
      final error = NetworkException.fromDioError(e);
      if(error.type != NetworkExceptionType.cancelled) {
        GlobalSnackBar.showError(error.message);
      }
      throw NetworkException.fromDioError(e);
    } on SocketException catch (e) {
      GlobalSnackBar.showError("");
      throw NetworkException("No internet connection: ${e.message}", NetworkExceptionType.noInternet,);
    } catch (e) {
      GlobalSnackBar.showError("");
      throw NetworkException("An unexpected error occurred: $e", NetworkExceptionType.unknown,);
    }
  }

  static Future<T?> put<T>(String api, CancelToken cancelToken, [Object? data]) async {
    try {
      var response = await _dio.put(api, data: data, cancelToken: cancelToken);
      return response.data;
    } on DioException catch (e) {
      final error = NetworkException.fromDioError(e);
      if(error.type != NetworkExceptionType.cancelled) {
        GlobalSnackBar.showError(error.message);
      }
      throw NetworkException.fromDioError(e);
    } on SocketException catch (e) {
      GlobalSnackBar.showError("");
      throw NetworkException("No internet connection: ${e.message}", NetworkExceptionType.noInternet,);
    } catch (e) {
      GlobalSnackBar.showError("");
      throw NetworkException("An unexpected error occurred: $e", NetworkExceptionType.unknown,);
    }
  }

  static Future<T?> delete<T>(String api, CancelToken cancelToken, [Object? data, Map<String, dynamic>? params]) async {
    try {
      var response = await _dio.delete(api, data: data, queryParameters: params, cancelToken: cancelToken);
      return response.data;
    } on DioException catch (e) {
      final error = NetworkException.fromDioError(e);
      if(error.type != NetworkExceptionType.cancelled) {
        GlobalSnackBar.showError(error.message);
      }
      throw NetworkException.fromDioError(e);
    } on SocketException catch (e) {
      GlobalSnackBar.showError("");
      throw NetworkException("No internet connection: ${e.message}", NetworkExceptionType.noInternet,);
    } catch (e) {
      GlobalSnackBar.showError("");
      throw NetworkException("An unexpected error occurred: $e", NetworkExceptionType.unknown,);
    }
  }

  /* Http Apis */
  static final String apiFetchUserData = "/api/v1/user";

  /* Http Params */
  static Map<String, dynamic> paramsLogin(String phone, String password) {
    return { "phone": phone, "password": password };
  }
}
