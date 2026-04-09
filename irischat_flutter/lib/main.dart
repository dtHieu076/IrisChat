import 'package:flutter/material.dart';
import 'package:irischat_flutter/share/providers/app_providers.dart';
import 'package:irischat_flutter/share/di/locator.dart';
import 'features/auth/presentation/login_screen.dart';

void main() async {
  // 1. Đảm bảo các dịch vụ hệ thống của Flutter đã sẵn sàng
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Khởi tạo "Tổng kho" Locator (GetIt)
  await setupLocator();

  // 3. Chạy App và bọc trong "Bảng điện tổng" AppProviders
  runApp(const AppProviders(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IrisChat',

      // Theme chuẩn của dự án
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00A3FF)),
        useMaterial3: true,
      ),

      // Điều hướng vào màn hình đầu tiên
      home: const LoginScreen(),
    );
  }
}
