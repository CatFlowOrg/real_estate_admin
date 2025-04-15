import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:real_estate_admin/core/ui/app_text_styles.dart';
import 'package:real_estate_admin/core/ui/components/circle_icon_button.dart';
import 'package:real_estate_admin/features/auth/data/models/user_response.dart';

class HeaderSectionAdminPanel extends StatelessWidget {
  final UserResponse userResponse;
  final VoidCallback? notificationButton;
  final VoidCallback? addWidgetButton;

  const HeaderSectionAdminPanel({
    super.key,
    required this.userResponse,
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
            backgroundImage: NetworkImage(userResponse.imageUrl!),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userResponse.firstName!,
                style: AppTextStyles.nameText(context),
              ),
              Text(
                userResponse.role!,
                style: AppTextStyles.roleText(context),
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