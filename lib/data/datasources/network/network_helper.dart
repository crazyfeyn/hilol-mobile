import 'package:commerce_mobile/core/services/lang_service.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/data/datasources/network/network_service.dart';
import 'package:commerce_mobile/data/repositories/user_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart' as context;
import 'package:uuid/uuid.dart';

class NetworkInterceptor extends Interceptor {
  final Dio dio;

  NetworkInterceptor(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final langCode = LangService.currentLocale;
    final backendLangKey = LangService.currentBackendLanguageKey;
    final accessToken = DBService.getAccessToken();

    if (NetworkService.shouldUseAuthHeader(options.path) &&
        accessToken.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $accessToken";
    } else {
      options.headers.remove("Authorization");
    }
    options.headers["X-Request-UUID"] = const Uuid().v4();
    options.headers["X-Client-Lang"] = langCode;
    options.headers["X-Language"] = backendLangKey;
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final repository = UserRepositoryImpl();

    // Don't handle refresh logic for auth endpoints
    if (err.requestOptions.path.contains("auth")) {
      return handler.next(err);
    }

    // Check if error is 401 (Unauthorized)
    if (err.response?.statusCode == 401) {
      final refreshToken = DBService.getRefreshToken();
      final userClientId = DBService.getUserData()?.clientId;
      final storedClientId = DBService.getClientId();
      final clientId =
          (userClientId != null && userClientId.isNotEmpty)
              ? userClientId
              : storedClientId;

      // Only attempt token refresh if we have both refresh token and client ID
      if (refreshToken.isNotEmpty && clientId.isNotEmpty) {
        final result = await repository.onRefreshToken(clientId, refreshToken);
        if (result.isRight()) {
          final res = result.getOrElse(
            () => throw Exception(context.tr(LocaleKeys.unexpected_error)),
          );
          if (res) {
            final newHeaders = Map<String, dynamic>.from(
              err.requestOptions.headers,
            );
            newHeaders['Authorization'] =
                'Bearer ${DBService.getAccessToken()}';
            final clonedRequest = err.requestOptions.copyWith(
              headers: newHeaders,
            );
            final response = await dio.fetch(clonedRequest);
            return handler.resolve(response);
          } else {
            // Token refresh failed, clear tokens and proceed with error
            await DBService.logOut();
            return handler.next(err);
          }
        } else {
          // Token refresh failed, clear tokens and proceed with error
          await DBService.logOut();
          return handler.next(err);
        }
      } else {
        // No valid refresh token or client ID, clear tokens and proceed with error
        await DBService.logOut();
        return handler.next(err);
      }
    }

    return handler.next(err);
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
  notFound,
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
        return NetworkException(
          LocaleKeys.timeout_message.tr(),
          NetworkExceptionType.timeout,
        );
      case DioExceptionType.connectionError:
        return NetworkException(
          LocaleKeys.check_internet_connection.tr(),
          NetworkExceptionType.noInternet,
        );
      case DioExceptionType.badResponse:
        final res = e.response?.data["error"];
        return NetworkException(
          code: res?["code"],
          httpStatus: res?["httpStatus"],
          res?["message"] ?? "",
          NetworkExceptionType.serverError,
        );
      case DioExceptionType.badCertificate:
        return NetworkException(
          LocaleKeys.bad_certificate_message.tr(),
          NetworkExceptionType.badCertificate,
        );
      case DioExceptionType.cancel:
        return NetworkException(
          e.message ?? "",
          NetworkExceptionType.cancelled,
        );
      default:
        return NetworkException(
          LocaleKeys.dio_unknown_message.tr(args: [e.message ?? ""]),
          NetworkExceptionType.unknown,
        );
    }
  }

  @override
  String toString() => message;
}
