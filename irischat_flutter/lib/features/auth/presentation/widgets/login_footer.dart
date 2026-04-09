import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("New to IrisChat?"),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Create an Account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),
        
        const Text(
          "© 2024 IRISCHAT TECHNOLOGIES",
          style: TextStyle(fontSize: 10, letterSpacing: 2, color: Colors.grey),
        ),
      ],
    );
  }
}
