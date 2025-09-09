import 'dart:io';

import 'package:commerce_mobile/core/services/lang_service.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/data/datasources/network/network_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';


class NetworkService {
  static bool _isTester = true;
  static final _serverDev = "http://131.153.18.44:8080";
  static final _serverProd = "http://131.153.18.44:8080";

  static String get getService {
    if (_isTester) return _serverDev;
    return _serverProd;
  }

  static Map<String, String> get getHeaders {
    final langCode = LangService.currentLocale;
    final accessToken = DBService.getAccessToken();
    return {
      "token": accessToken,
      "X-Device-Type": Platform.operatingSystem,
      "X-Request-UUID": Uuid().v4(),
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
      throw NetworkException.fromDioError(e);
    } on SocketException catch (_) {
      throw NetworkException(LocaleKeys.check_internet_connection.tr(), NetworkExceptionType.noInternet);
    } catch (e) {
      throw NetworkException(LocaleKeys.dio_unknown_message.tr(args: [e.toString()]), NetworkExceptionType.unknown);
    }
  }

  static Future<T?> post<T>(String api, CancelToken cancelToken, [Object? data, Map<String, dynamic>? params]) async {
    try {
      var response = await _dio.post(api, data: data, queryParameters: params, cancelToken: cancelToken);
      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    } on SocketException catch (_) {
      throw NetworkException(LocaleKeys.check_internet_connection.tr(), NetworkExceptionType.noInternet);
    } catch (e) {
      throw NetworkException(LocaleKeys.dio_unknown_message.tr(args: [e.toString()]), NetworkExceptionType.unknown);
    }
  }

  static Future<T?> put<T>(String api, CancelToken cancelToken, [Object? data]) async {
    try {
      var response = await _dio.put(api, data: data, cancelToken: cancelToken);
      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    } on SocketException catch (_) {
      throw NetworkException(LocaleKeys.check_internet_connection.tr(), NetworkExceptionType.noInternet);
    } catch (e) {
      throw NetworkException(LocaleKeys.dio_unknown_message.tr(args: [e.toString()]), NetworkExceptionType.unknown);
    }
  }

  static Future<T?> delete<T>(String api, CancelToken cancelToken, [Object? data, Map<String, dynamic>? params]) async {
    try {
      var response = await _dio.delete(api, data: data, queryParameters: params, cancelToken: cancelToken);
      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    } on SocketException catch (_) {
      throw NetworkException(LocaleKeys.check_internet_connection.tr(), NetworkExceptionType.noInternet);
    } catch (e) {
      throw NetworkException(LocaleKeys.dio_unknown_message.tr(args: [e.toString()]), NetworkExceptionType.unknown);
    }
  }

  /* Http Apis */
  static final String apiAuthSignUp = "/api/v1/auth/register";
  static final String apiFetchUserData = "/api/v1/user";

  /* Http Params */
  static Map<String, dynamic> paramsLogin(String phone, String password) {
    return { "phone": phone, "password": password };
  }
}
