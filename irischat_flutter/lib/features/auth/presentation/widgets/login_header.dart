import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: const Icon(
            Icons.bubble_chart,
            size: 40,
            color: Color(0xFF00A3FF),
          ),
        ),

        const SizedBox(height: 16),

        const Text(
          "IrisChat",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: Color(0xFF00A3FF), // Màu primary
          ),
        ),

        const Text(
          "Luminous conversations await",
          style: TextStyle(
            color: Color(0xFF536B7C),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
