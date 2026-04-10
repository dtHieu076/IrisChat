import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF9F9FF).withOpacity(0.9),
      elevation: 0,
      scrolledUnderElevation:
          0, // Bỏ hiệu ứng đổi màu khi scroll của Material 3
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF0058BC).withOpacity(0.1),
                width: 2,
              ),
              image: const DecorationImage(
                image: NetworkImage('https://i.pravatar.cc/150?img=11'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Messages',
            style: TextStyle(
              color: Color(0xFF181C23),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.edit_square, color: Color(0xFF0058BC)),
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: const Color(0xFF0058BC).withOpacity(0.1),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
