import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:irischat_flutter/share/di/locator.dart';
import 'package:irischat_flutter/share/logic/auth/i_auth_provider.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Đăng ký IAuthProvider thông qua Service Locator (sl)
        // Lưu ý: Dùng Interface IAuthProvider thay vì Impl để đúng chuẩn "giấu code"
        ChangeNotifierProvider<IAuthProvider>(
          create: (_) => sl<IAuthProvider>(),
        ),
        
        // Sau này bạn thêm các Provider khác ở đây cực kỳ dễ dàng:
        // ChangeNotifierProvider<IChatProvider>(create: (_) => sl<IChatProvider>()),
      ],
      child: child,
    );
  }
}