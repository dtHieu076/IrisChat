import 'package:flutter/material.dart';
import 'widgets/login_footer.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF0FAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              SizedBox(height: 60),
              LoginHeader(),
              SizedBox(height: 48),
              LoginForm(), // Chứa các Input và Button
              SizedBox(height: 32),
              LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
