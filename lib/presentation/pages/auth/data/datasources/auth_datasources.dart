import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/presentation/pages/auth/data/models/register_user_model.dart';
import 'package:dio/dio.dart';

class AuthDatasources {
  final Dio dio;

  AuthDatasources({required this.dio});

  Future<void> register(RegisterUserModel model) async {
    try {
      final response = await dio.post(
        "http://131.153.18.44:8080/api/v1/client/register",
        data: model.toJson(),
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData['success'] == true) {
          final clientId = responseData['data']['clientId'];
          await DBService.setAccessToken(clientId);
        } else {
          // 'error': responseData['error']['message'],
        }
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      if (e.response != null) {
        final errorData = e.response!.data;
      } else {
        // 'error': 'Network error: ${e.message}'
      }
    } catch (e) {
      // 'error': 'Unexpected error: $e'
    }
  }
}
