import 'package:flutter/material.dart';
import 'package:irischat_flutter/share/logic/auth/auth_state.dart';
import 'package:irischat_flutter/share/logic/auth/i_auth_provider.dart';
import 'package:provider/provider.dart';
import 'login_input_field.dart';
import 'login_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Chỉ cần watch state để biết có đang loading hay không
    final authState = context.watch<IAuthProvider>().state;
    final isLoading = authState is AuthLoading;

    return Column(
      children: [
        LoginInputField(
          label: "Phone Number",
          hintText: "+84 00 000 0000",
          icon: Icons.phone_iphone,
          controller: _phoneController,
        ),

        const SizedBox(height: 20),

        LoginInputField(
          label: "Password",
          hintText: "••••••••",
          icon: Icons.lock_outline,
          isPassword: true,
          controller: _passwordController,
        ),

        const SizedBox(height: 32),

        LoginButton(
          isLoading: isLoading,
          onPressed: () => _handleLogin(context),
        ),
      ],
    );
  }

  Future<void> _handleLogin(BuildContext context) async {
    final phoneNumber = _phoneController.text.trim();
    final password = _passwordController.text.trim();
    final authProvider = context.read<IAuthProvider>();

    // 1. Kiểm tra đầu vào cơ bản
    if (phoneNumber.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Vui lòng nhập đầy đủ thông tin!")),
      );
      return;
    }

    // 2. Đóng bàn phím khi bắt đầu đăng nhập
    FocusManager.instance.primaryFocus?.unfocus();

    // 4. Gọi action và CHỜ đợi kết quả (vì hàm này là Future)
    await authProvider.loginAction(phoneNumber, password);

    // 5.Nếu màn hình đã bị tắt (!mounted), ta không được phép dùng context nữa để tránh Crash app.
    if (!mounted) return;

    // 6. Đọc trạng thái cuối cùng và xử lý giao diện
    final finalState = authProvider.state;

    if (finalState is AuthSuccess) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Đăng nhập thành công!")));
      // TODO: Điều hướng sang trang chính Navigator.pushReplacementNamed(context, '/home');
    } else if (finalState is AuthFailure) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Lỗi: ${finalState.message}")));
    }
  }
}
