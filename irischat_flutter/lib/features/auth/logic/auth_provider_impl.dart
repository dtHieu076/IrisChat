import 'package:irischat_flutter/share/logic/auth/auth_state.dart';
import 'package:irischat_flutter/share/logic/auth/i_auth_provider.dart';
import 'package:irischat_flutter/share/logic/auth/i_auth_repository.dart';
import '../data/auth_models.dart';

class AuthProviderImpl extends IAuthProvider {
  final IAuthRepository _authRepository;

  AuthProviderImpl(this._authRepository);

  // --- QUẢN LÝ STATE ---
  AuthState _state = const AuthInitial();
  @override
  AuthState get state => _state;

  UserInfo? _currentUser;
  @override
  UserInfo? get currentUser => _currentUser;

  @override
  bool get isAuthenticated => _currentUser != null;

  @override
  Future<void> loginAction(String phoneNumber, String password) async {
    _state = const AuthLoading(); // Cập nhật trạng thái Loading
    notifyListeners();

    try {
      final request = LoginRequest(
        phoneNumber: phoneNumber,
        password: password,
      );
      final response = await _authRepository.login(request);

      _currentUser = response.userInfo;
      _state = AuthSuccess(_currentUser!); // Cập nhật trạng thái Thành công
    } catch (e) {
      _state = AuthFailure(e.toString()); // Cập nhật trạng thái Thất bại
    } finally {
      notifyListeners();
    }
  }

  @override
  void logoutAction() {
    _currentUser = null;
    _state = const AuthInitial();
    notifyListeners();
  }
}
