import 'package:smart_farm/src/model/repository/auth/auth_api_client.dart';
import 'package:smart_farm/src/model/response/auth/login.dart';

class AuthRepository {
  final AuthApiClient authApiClient;
  const AuthRepository({required this.authApiClient});

  Future<LoginResponse> login(String username, String password) async {
    try {
      return await authApiClient.login(username, password);
    } catch (e) {
      rethrow;
    }
  }
}
