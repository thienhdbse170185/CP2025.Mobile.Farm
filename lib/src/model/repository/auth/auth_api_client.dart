import 'package:dio/dio.dart';
import 'package:smart_farm/api_endpoints.dart';
import 'package:smart_farm/src/model/response/auth/login.dart';

class AuthApiClient {
  final Dio dio;
  const AuthApiClient({required this.dio});

  Future<LoginResponse> login(String username, String password) async {
    try {
      final response = await dio.post(ApiEndpoints.login, data: {
        "username": username,
        "password": password,
      });
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data['result']);
      } else {
        throw Exception('Failed to login');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('wrong-credentials');
      } else {
        throw Exception('Failed to login');
      }
    }
  }
}
