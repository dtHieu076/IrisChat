import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
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
          onPressed: () {
            // Gọi logic Login từ Provider ở đây
            print("Login với: ${_phoneController.text}");
          },
        ),
      ],
    );
  }
}
