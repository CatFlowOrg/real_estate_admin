import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

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
    this.notificationButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 0),
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
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const Spacer(),
          _buildIconButton(
            icon: Symbols.notifications,
            onPressed: notificationButton,
          ),
          _buildIconButton(
            icon: Symbols.add,
            onPressed: addWidgetButton,
            weight: 700,
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    VoidCallback? onPressed,
    double weight = 400,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFEEEEEE),
        ),
        child: Icon(
          icon,
          size: 20,
          weight: weight,
          fill: 0,
          color: Colors.black,
        ),
      ),
    );
  }
}
