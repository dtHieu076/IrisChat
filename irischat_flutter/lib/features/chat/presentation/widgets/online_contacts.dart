import 'package:flutter/material.dart';
import 'contact_avatar_card.dart';

class OnlineContacts extends StatelessWidget {
  const OnlineContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data để hiển thị giao diện
    final List<Map<String, String>> contacts = [
      {'name': 'Sarah', 'img': 'https://i.pravatar.cc/150?img=1'},
      {'name': 'Marcus', 'img': 'https://i.pravatar.cc/150?img=2'},
      {'name': 'Elena', 'img': 'https://i.pravatar.cc/150?img=3'},
      {'name': 'David', 'img': 'https://i.pravatar.cc/150?img=4'},
      {'name': 'Jessica', 'img': 'https://i.pravatar.cc/150?img=5'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ONLINE NOW',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF414755),
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0058BC),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100, // Chiều cao cố định cho ListView ngang
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            scrollDirection: Axis.horizontal,
            itemCount: contacts.length,
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              return ContactAvatarCard(
                name: contacts[index]['name']!,
                imageUrl: contacts[index]['img']!,
                isFirst:
                    index == 0, // Cấp gradient cho item đầu tiên giống HTML
              );
            },
          ),
        ),
      ],
    );
  }
}
