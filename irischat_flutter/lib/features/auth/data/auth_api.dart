import '../../../share/api/api_constants.dart';
import '../../../share/api/api_client.dart';
import 'auth_models.dart';

class AuthApi {
  final ApiClient _apiClient;

  AuthApi(this._apiClient);

  // Hàm login
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _apiClient.dio.post(
        ApiConstants.login,
        data: request.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
