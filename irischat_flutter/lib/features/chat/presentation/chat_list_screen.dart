import 'package:flutter/material.dart';
import 'package:irischat_flutter/features/chat/presentation/widgets/bottom_nav_bar.dart';
import 'package:irischat_flutter/features/chat/presentation/widgets/chat_app_bar.dart';
import 'package:irischat_flutter/features/chat/presentation/widgets/chat_list_view.dart';
import 'package:irischat_flutter/features/chat/presentation/widgets/chat_search_bar.dart';
import 'package:irischat_flutter/features/chat/presentation/widgets/online_contacts.dart';
// Import các file widget của bạn ở đây...

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Màu nền tương ứng với class bg-surface
      backgroundColor: const Color(0xFFF9F9FF),
      appBar: const ChatAppBar(),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChatSearchBar(),
            SizedBox(height: 24),
            OnlineContacts(),
            SizedBox(height: 32),
            ChatListView(),
            SizedBox(height: 32), // Khoảng trống cho bottom nav bar
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
