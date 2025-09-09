import 'package:commerce_mobile/core/services/lang_service.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

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
  final int? code;
  final int? httpStatus;
  final String message;
  final NetworkExceptionType type;

  NetworkException(this.message, this.type, {this.code, this.httpStatus});

  factory NetworkException.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(LocaleKeys.timeout_message.tr(), NetworkExceptionType.timeout);
      case DioExceptionType.connectionError:
        return NetworkException(LocaleKeys.check_internet_connection.tr(), NetworkExceptionType.noInternet);
      case DioExceptionType.badResponse:
        final res = e.response?.data["error"];
        return NetworkException(code: res["code"], httpStatus: res["httpStatus"], res["message"] ?? "", NetworkExceptionType.serverError);
      case DioExceptionType.badCertificate:
        return NetworkException(LocaleKeys.bad_certificate_message.tr(), NetworkExceptionType.badCertificate);
      case DioExceptionType.cancel:
        return NetworkException(e.message ?? "", NetworkExceptionType.cancelled);
      default:
        return NetworkException(LocaleKeys.dio_unknown_message.tr(args: [e.message ?? ""]), NetworkExceptionType.unknown);
    }
  }

  @override
  String toString() => message;
}
