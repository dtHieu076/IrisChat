import 'package:flutter/material.dart';
import 'chat_item_tile.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy Data
    final List<Map<String, dynamic>> chats = [
      {
        'name': 'Alex Rivera',
        'time': '14:22',
        'message': 'Can we review the final mockups tonight?',
        'unreadCount': 3,
        'imageUrl': 'https://i.pravatar.cc/150?img=6',
      },
      {
        'name': 'Sophie Chen',
        'time': 'Yesterday',
        'message': 'That photo looks amazing! Where was it taken?',
        'unreadCount': 0,
        'imageUrl': 'https://i.pravatar.cc/150?img=7',
      },
      {
        'name': 'Julian Black',
        'time': 'Mon',
        'message': 'The client approved the budget increase!',
        'unreadCount': 1,
        'imageUrl': 'https://i.pravatar.cc/150?img=8',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'RECENT CHATS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF414755),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            physics:
                const NeverScrollableScrollPhysics(), // Để Listview scroll theo SingleChildScrollView ngoài cùng
            shrinkWrap: true,
            itemCount: chats.length,
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            itemBuilder: (context, index) {
              final chat = chats[index];
              return ChatItemTile(
                name: chat['name'],
                message: chat['message'],
                time: chat['time'],
                unreadCount: chat['unreadCount'],
                imageUrl: chat['imageUrl'],
              );
            },
          ),
        ],
      ),
    );
  }
}
