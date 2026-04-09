import 'package:irischat_flutter/features/auth/data/auth_models.dart';

sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  final UserInfo user;
  const AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);
}

// AuthInitial: Không mang gì cả. Nhiệm vụ là báo hiệu: "App vừa mở, tôi chưa làm gì hết".

// AuthLoading: Có thể mang theo một thông báo (ví dụ: "Đang kết nối server...").

// AuthSuccess: Mang theo đối tượng User. Đây là nhiệm vụ quan trọng nhất. Thay vì để User nằm trôi nổi, nó được đóng gói vào "chiếc hộp" thành công.

// AuthFailure: Mang theo một chuỗi message lỗi.
