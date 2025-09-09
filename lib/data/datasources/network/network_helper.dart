import 'package:commerce_mobile/core/services/lang_service.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class NetworkInterceptor extends Interceptor {
  final Dio? authDio;
  bool _isRefreshing = false;

  NetworkInterceptor({this.authDio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final langCode = LangService.currentLocale;

    // Skip adding token for auth endpoints
    if (!_isAuthEndpoint(options.path)) {
      final accessToken = DBService.getAccessToken();
      if (accessToken.isNotEmpty) {
        options.headers["token"] = accessToken;
      }
    }

    options.headers["Accept-Language"] = langCode;
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Don't handle refresh logic for auth endpoints
    if (_isAuthEndpoint(err.requestOptions.path)) {
      return handler.next(err);
    }

    // Handle 401 errors (token expired)
    if (err.response?.statusCode == 401 && !_isRefreshing) {
      _isRefreshing = true;

      try {
        final success = await _refreshToken();

        if (success) {
          final newToken = DBService.getAccessToken();
          err.requestOptions.headers["token"] = newToken;

          // Retry the request
          final response = await _retry(err.requestOptions);
          _isRefreshing = false;
          return handler.resolve(response);
        } else {
          await _handleTokenRefreshFailure();
        }
      } catch (e) {
        await _handleTokenRefreshFailure();
      }

      _isRefreshing = false;
    }

    handler.next(err);
  }

  bool _isAuthEndpoint(String path) {
    final authPaths = [
      '/api/v1/auth/register',
      '/api/v1/auth/login',
      '/api/v1/auth/refresh-token',
      '/api/v1/auth/verify-phone',
    ];
    return authPaths.any((authPath) => path.contains(authPath));
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = DBService.getRefreshToken();
      if (refreshToken.isEmpty) {
        return false;
      }

      // Use separate Dio instance or create one for refresh to avoid interceptor loops
      final dio =
          authDio ??
          Dio(
            BaseOptions(
              baseUrl: _getBaseUrl(), // You'll need to implement this
              headers: {
                "Accept-Language": LangService.currentLocale,
                "Content-Type": "application/json",
              },
            ),
          );

      final response = await dio.post(
        '/api/v1/auth/refresh-token',
        data: {'refresh_token': refreshToken},
      );

      if (response.statusCode == 200) {
        final newAccessToken = response.data['access_token'];
        final newRefreshToken = response.data['refresh_token'];

        // Save new tokens
        await DBService.saveAccessToken(newAccessToken);
        if (newRefreshToken != null) {
          await DBService.saveRefreshToken(newRefreshToken);
        }

        return true;
      }
    } catch (e) {
      print('Token refresh failed: $e');
    }
    return false;
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: _getBaseUrl(),
        connectTimeout: requestOptions.connectTimeout,
        receiveTimeout: requestOptions.receiveTimeout,
      ),
    );

    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
        contentType: requestOptions.contentType,
        responseType: requestOptions.responseType,
      ),
    );
  }

  Future<void> _handleTokenRefreshFailure() async {
    try {
      await DBService.clearTokens();
      // You might want to navigate to login screen here
      // or emit an event to notify the app about logout
      // NavigationService.pushAndClearStack('/login');
      // or
      // EventBus.fire(LogoutEvent());
    } catch (e) {
      print('Error clearing tokens: $e');
    }
  }

  String _getBaseUrl() {
    return "http://131.153.18.44:8080";
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
