import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:real_estate_admin/core/ui/components/circle_icon_button.dart';

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
          const Spacer(), circleIconButton(
            icon: Symbols.notifications,
            onPressed: notificationButton,
          ),
          circleIconButton(
            icon: Symbols.add,
            onPressed: addWidgetButton,
            weight: 700,
          ),
        ],
      ),
    );
  }
}