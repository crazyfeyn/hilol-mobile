import 'package:commerce_mobile/core/services/lang_service.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:dio/dio.dart';

class NetworkInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final langCode = LangService.currentLocale;
    final accessToken = DBService.getAccessToken();

    final headers = { "token": accessToken, "Accept-Language": langCode };
    options.headers.addAll(headers);
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}

enum NetworkExceptionType {
  noInternet,
  timeout,
  serverError,
  cancelled,
  formatError,
  badCertificate,
  unknown,
}

class NetworkException implements Exception {
  final String message;
  final NetworkExceptionType type;

  NetworkException(this.message, this.type);

  factory NetworkException.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException("timeout_message", NetworkExceptionType.timeout);
      case DioExceptionType.connectionError:
        return NetworkException("check_internet_connection", NetworkExceptionType.noInternet);
      case DioExceptionType.badResponse:
        return NetworkException(e.response?.data["message"] ?? "", NetworkExceptionType.serverError);
      case DioExceptionType.badCertificate:
        return NetworkException("bad_certificate_message", NetworkExceptionType.badCertificate);
      case DioExceptionType.cancel:
        return NetworkException(e.message ?? "", NetworkExceptionType.cancelled);
      default:
        return NetworkException("dio_unknown_message", NetworkExceptionType.unknown);
    }
  }

  @override
  String toString() => message;
}
