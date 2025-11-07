import 'dart:io';
import 'package:commerce_mobile/core/services/lang_service.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/data/datasources/network/network_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';

class NetworkService {
  static bool isTester = true;
  static final _serverDev = "https://hilol-market.kr";
  static final _serverProd = "https://hilol-market.kr";

  static String get getService {
    if (isTester) return _serverDev;
    return _serverProd;
  }

  static Map<String, String> get getHeaders {
    final langCode = LangService.currentLocale;
    final accessToken = DBService.getAccessToken();

    return {
      "X-Device-Type": Platform.operatingSystem,
      "Authorization": "Bearer $accessToken",
      "X-Request-UUID": const Uuid().v4(),
      "X-Client-Lang": langCode,
    };
  }

  static Dio get _dio {
    final dio = Dio(BaseOptions(baseUrl: getService, headers: getHeaders))
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio..interceptors.add(NetworkInterceptor(dio));
  }

  /* Http Requests */
  static Future<T?> get<T>(
    String api,
    CancelToken cancelToken, [
    Map<String, dynamic>? params,
  ]) async {
    try {
      var response = await _dio.get(
        api,
        queryParameters: params,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    } on SocketException catch (_) {
      throw NetworkException(
        LocaleKeys.check_internet_connection.tr(),
        NetworkExceptionType.noInternet,
      );
    } catch (e) {
      throw NetworkException(
        LocaleKeys.dio_unknown_message.tr(args: [e.toString()]),
        NetworkExceptionType.unknown,
      );
    }
  }

  static Future<T?> post<T>(
    String api,
    CancelToken cancelToken, [
    Object? data,
    Map<String, dynamic>? params,
  ]) async {
    try {
      var response = await _dio.post(
        api,
        data: data,
        queryParameters: params,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    } on SocketException catch (_) {
      throw NetworkException(
        LocaleKeys.check_internet_connection.tr(),
        NetworkExceptionType.noInternet,
      );
    } catch (e) {
      throw NetworkException(
        LocaleKeys.dio_unknown_message.tr(args: [e.toString()]),
        NetworkExceptionType.unknown,
      );
    }
  }

  static Future<T?> put<T>(
    String api,
    CancelToken cancelToken, [
    Object? data,
  ]) async {
    try {
      var response = await _dio.put(api, data: data, cancelToken: cancelToken);
      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    } on SocketException catch (_) {
      throw NetworkException(
        LocaleKeys.check_internet_connection.tr(),
        NetworkExceptionType.noInternet,
      );
    } catch (e) {
      throw NetworkException(
        LocaleKeys.dio_unknown_message.tr(args: [e.toString()]),
        NetworkExceptionType.unknown,
      );
    }
  }

  static Future<T?> delete<T>(
    String api,
    CancelToken cancelToken, [
    Object? data,
    Map<String, dynamic>? params,
  ]) async {
    try {
      var response = await _dio.delete(
        api,
        data: data,
        queryParameters: params,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    } on SocketException catch (_) {
      throw NetworkException(
        LocaleKeys.check_internet_connection.tr(),
        NetworkExceptionType.noInternet,
      );
    } catch (e) {
      throw NetworkException(
        LocaleKeys.dio_unknown_message.tr(args: [e.toString()]),
        NetworkExceptionType.unknown,
      );
    }
  }

  static Future<T?> multipartImage<T>(String api, CancelToken cancelToken, String path, [Map<String, dynamic>? params]) async {
    try {
      String fileName = path.split('/').last;
      final image = await MultipartFile.fromFile(path, filename: fileName);
      final data = FormData.fromMap({ "file": image });
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

  /* Http Apis */
  static final String apiAuthSignUp = "/api/v1/auth/register";
  static final String apiAuthSignIn = "/api/v1/auth/login";
  static final String apiAuthConfirmPass = "/api/v1/auth/verify-phone";
  static final String apiResetPass = "/api/v1/auth/reset-password";
  static final String apiRefreshToken = "/api/v1/auth/refresh-token";
  static final String apiGetUser = "/api/v1/user";
  static final String apiUserUploadImage = "/api/v1/user/upload/image";
  static final String apiUserUpdateUserInfo = "/api/v1/user/update/user-info";
  static final String apiUserDeleteAccount = "/api/v1/delete/account";
  static final String apiGetAllCategories = "/api/v1/product-category/all";
  static final String apiGetAllProducts = "/api/v1/product/get-all";
  static final String apiGetProductById = "/api/v1/product/get";
  static final String apiGetProductsByCategory =
      "/api/v1/product/get-by-category";
  static final String apiFileDownload = "/api/v1/file/download";
  static const String apiOrderUploadLocationImage =
      '/api/v1/order/upload-location-image';

  /* Http Params */
  static Map<String, dynamic> paramsRefreshToken(
    String clientId,
    String refreshToken,
  ) {
    return {"clientId": clientId, "refreshToken": refreshToken};
  }

  static FormData paramsUserUploadImage(dynamic image) {
    return FormData.fromMap({"image": image});
  }

  static Map<String, dynamic> paramsUserInfo(
    String firstname,
    String lastname,
  ) {
    return {"firstname": firstname, "lastname": lastname};
  }
}
