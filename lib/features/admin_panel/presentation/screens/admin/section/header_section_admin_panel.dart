import 'package:flutter/material.dart';

class HeaderSectionAdminPanel extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final String userRole;
  final VoidCallback? notificationButton;
  final VoidCallback? addWidgetButton;

  const HeaderSectionAdminPanel({
    super.key,
    required this.imageUrl,
    required this.userName,
    required this.userRole,
    this.addWidgetButton,
    this.notificationButton
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                userRole,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          const Spacer(),

          ClipOval(
            child: Material(
              color: Color(0xFFE8E8E8),
              child: InkWell(
                splashColor: Colors.grey, // Splash color
                onTap: notificationButton,
                child: SizedBox(width: 40, height: 40, child: Icon(Icons.notifications_outlined)),
              ),
            ),
          ),
          SizedBox(width: 7),
          ClipOval(
            child: Material(
              color: Color(0xFFE8E8E8),
              child: InkWell(
                splashColor: Colors.grey, // Splash color
                onTap: addWidgetButton,
                child: SizedBox(width: 40, height: 40, child: Icon(Icons.add)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
