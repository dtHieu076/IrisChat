import 'package:flutter/material.dart';

class ContactAvatarCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isFirst;

  const ContactAvatarCard({
    Key? key,
    required this.name,
    required this.imageUrl,
    this.isFirst = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 64,
              height: 64,
              padding: const EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // Tạo viền Gradient nếu là item đặc biệt
                gradient: isFirst
                    ? const LinearGradient(
                        colors: [Color(0xFF0058BC), Color(0xFFA1BEFD)],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      )
                    : null,
                color: isFirst ? null : Colors.transparent,
                border: isFirst
                    ? null
                    : Border.all(color: const Color(0xFFE6E8F3), width: 2),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFF9F9FF), width: 2),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Chấm Online màu xanh lá
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981), // emerald-500
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFF9F9FF), width: 2),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Color(0xFF414755),
          ),
        ),
      ],
    );
  }
}
