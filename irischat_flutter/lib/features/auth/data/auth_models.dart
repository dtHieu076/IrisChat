// Định dạng cấu trúc request
class LoginRequest {
  final String phoneNumber;
  final String password;

  LoginRequest({required this.phoneNumber, required this.password});

  Map<String, dynamic> toJson() {
    return {'phoneNumber': phoneNumber, 'password': password};
  }
}

class RegisterRequest {
  final String phoneNumber;
  final String password;
  final String displayName;
  final String avatarUrl;

  RegisterRequest({
    required this.phoneNumber,
    required this.password,
    required this.displayName,
    required this.avatarUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'password': password,
      'displayName': displayName,
      'avatarUrl': avatarUrl,
    };
  }
}

// Định dạng cáu trúc response
class LoginResponse {
  final String accessToken;
  final String refreshToken;
  final UserInfo userInfo;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.userInfo,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      userInfo: UserInfo.fromJson(json['userInfo']),
    );
  }
}

class UserInfo {
  final String id;
  final String username_clean;
  final String display_name;
  final String avatarUrl;

  UserInfo({
    required this.id,
    required this.username_clean,
    required this.display_name,
    required this.avatarUrl,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'],
      username_clean: json['username_clean'],
      display_name: json['display_name'],
      avatarUrl: json['avatarUrl'],
    );
  }
}
