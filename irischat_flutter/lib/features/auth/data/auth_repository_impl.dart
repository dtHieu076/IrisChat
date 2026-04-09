import 'package:irischat_flutter/features/auth/data/auth_api.dart';
import 'package:irischat_flutter/features/auth/data/auth_models.dart';
import 'package:irischat_flutter/share/logic/auth/i_auth_repository.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final AuthApi _authApi;

  AuthRepositoryImpl(this._authApi);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      // 1. Gọi API
      final LoginResponse response = await _authApi.login(request);

      // 2. Logic sửa lý response nếu cần thiết trước khi trả về

      // 3. Trả về response
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
