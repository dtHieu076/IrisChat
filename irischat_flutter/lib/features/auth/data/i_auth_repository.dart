import 'package:irischat_flutter/features/auth/data/auth_models.dart';

abstract class IAuthRepository {
  // Hàm login
  Future<LoginResponse> login(LoginRequest request);
}
