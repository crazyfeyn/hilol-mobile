import 'dart:convert';
import 'dart:io';
import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/services/environment_service.dart';
import 'package:commerce_mobile/core/services/lang_service.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/data/datasources/network/network_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_alice/alice.dart';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

// Create Alice with the navigator key
final _alice = Alice(navigatorKey: NavigationService.navigatorKey);

class NetworkService {
  static bool isTester = true;
  static final _serverDev = EnvironmentService.apiBaseUrl;
  static final _serverProd = EnvironmentService.apiBaseUrl;

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
    return dio..interceptors.add(NetworkInterceptor(dio))
      ..interceptors.add(_alice.getDioInterceptor());
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

  static Map<String, String> getHeadersWithUUID([String? customUUID]) {
    final langCode = LangService.currentLocale;
    final accessToken = DBService.getAccessToken();

    return {
      "X-Device-Type": Platform.operatingSystem,
      "Authorization": "Bearer $accessToken",
      "X-Request-UUID": customUUID ?? const Uuid().v4(),
      "X-Client-Lang": langCode,
    };
  }

  static Future<T?> post<T>(
    String api,
    CancelToken cancelToken, [
    Object? data,
    Map<String, dynamic>? params,
    Map<String, String>? customHeaders, // ✅ 5th parameter
  ]) async {
    try {
      // Extract UUID from customHeaders if present
      String? customUUID = customHeaders?['X-Request-UUID'];
      final baseHeaders = getHeadersWithUUID(customUUID);

      // Merge other headers (excluding UUID since it's already in baseHeaders)
      final otherHeaders = Map<String, String>.from(customHeaders ?? {})
        ..remove('X-Request-UUID');
      final headers = {...baseHeaders, ...otherHeaders};

      var response = await _dio.post(
        api,
        data: data,
        queryParameters: params,
        cancelToken: cancelToken,
        options: Options(headers: headers),
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

  // 3. Update postMultipart to handle custom UUID
  static Future<T?> postMultipart<T>(
    String api,
    CancelToken cancelToken,
    FormData formData, [
    Map<String, dynamic>? params,
    Map<String, String>? additionalHeaders,
  ]) async {
    try {
      // Extract UUID from additionalHeaders if present
      String? customUUID = additionalHeaders?['X-Request-UUID'];
      final baseHeaders = getHeadersWithUUID(customUUID);

      // Merge other headers
      final otherHeaders = Map<String, String>.from(additionalHeaders ?? {})
        ..remove('X-Request-UUID');
      final headers = {...baseHeaders, ...otherHeaders};

      var response = await _dio.post(
        api,
        data: formData,
        queryParameters: params,
        cancelToken: cancelToken,
        options: Options(headers: headers, contentType: 'multipart/form-data'),
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
    Object? data, Map<String, dynamic>? params,
  ]) async {
    try {
      var response = await _dio.put(api, data: data, queryParameters: params, cancelToken: cancelToken);
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

  //? Multipart Upload Methods
  static http.MultipartRequest createMultipartRequest(
    String endpoint,
    CancelToken cancelToken,
    Map<String, String> fields, {
    Map<String, String>? headers,
  }) {
    final baseUrl = Uri.parse('$getService$endpoint');
    final queryParams = {...fields};

    final url = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      port: baseUrl.port,
      path: baseUrl.path,
      queryParameters: {...baseUrl.queryParameters, ...queryParams},
    );

    final request = http.MultipartRequest('POST', url);

    // ✅ Build headers manually without auto-generated UUID
    final langCode = LangService.currentLocale;
    final accessToken = DBService.getAccessToken();

    final baseHeaders = {
      "X-Device-Type": Platform.operatingSystem,
      "Authorization": "Bearer $accessToken",
      "X-Client-Lang": langCode,
    };

    final allHeaders = {...baseHeaders, ...headers ?? {}};
    request.headers.addAll(allHeaders);

    return request;
  }

  static Future<http.MultipartFile> createMultipartFile(
    String fieldName,
    Stream<List<int>> stream,
    int length, {
    String? filename,
  }) async {
    return http.MultipartFile(fieldName, stream, length, filename: filename);
  }

  static Future<Map<String, dynamic>> sendMultipartRequest(
    http.MultipartRequest request,
  ) async {
    try {
      final response = await request.send();
      final responseString = await response.stream.bytesToString();

      print('📥 Response Status: ${response.statusCode}');
      print('📥 Response Body: $responseString');

      if (response.statusCode == 200) {
        return json.decode(responseString);
      } else {
        // ✅ Log the error response
        print('❌ Server Error Response: $responseString');
        throw NetworkException(
          'Upload failed with status: ${response.statusCode}\nResponse: $responseString',
          NetworkExceptionType.serverError,
        );
      }
    } catch (e) {
      print('❌ Upload Exception: $e');
      throw NetworkException(
        'Upload request failed: $e',
        NetworkExceptionType.noInternet,
      );
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
  static final String apiGetProductsByCategory = "/api/v1/product/get-by-category";
  static final String apiFileDownload = "/api/v1/file/download";
  static const String apiOrderUploadLocationImage = '/api/v1/order/upload-location-image';
  static final String apiOrderCreate = "/api/v1/order/create";
  static final String apiOrderFetchAllOrder = "/api/v1/order/get-all";
  static final String apiOrderFetchOrder = "/api/v1/order/get-all";
  static final String apiOrderCancel = "/api/v1/order/cancel";
  static final String apiOrderConfirm = "/api/v1/order/confirm";
  static final String apiPaymentCreate = "/api/v1/payment/create";

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

  static Map<String, dynamic> paramsOrder(int id) {
    return { "orderId": id };
  }

  static Map<String, dynamic> paramsOrderCancel(int id) {
    return { "orderId": id };
  }

  static Map<String, dynamic> paramsOrderConfirm(int id) {
    return { "orderId": id };
  }

  static Map<String, dynamic> paramsPaymentCreate(int id, String paymentMethod) {
    return { "orderId": id, "paymentMethod": paymentMethod  };
  }
}
