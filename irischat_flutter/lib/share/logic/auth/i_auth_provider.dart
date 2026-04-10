import 'package:flutter/material.dart';
import 'package:irischat_flutter/features/auth/data/auth_models.dart';
import 'package:irischat_flutter/share/logic/auth/auth_state.dart';

abstract class IAuthProvider extends ChangeNotifier {
  AuthState get state; // Người dùng quan sát cái này
  UserInfo? get currentUser;
  bool get isAuthenticated;

  Future<void> loginAction(String phoneNumber, String password);
  void logoutAction();

}
