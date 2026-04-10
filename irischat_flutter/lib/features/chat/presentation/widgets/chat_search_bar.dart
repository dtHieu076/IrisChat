import 'package:flutter/material.dart';

class ChatSearchBar extends StatelessWidget {
  const ChatSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFFE0E2ED), // surface-container-highest
          borderRadius: BorderRadius.circular(24),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search messages, people...',
            hintStyle: const TextStyle(color: Color(0xFF414755), fontSize: 14),
            prefixIcon: const Icon(Icons.search, color: Color(0xFF414755)),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );
  }
}
