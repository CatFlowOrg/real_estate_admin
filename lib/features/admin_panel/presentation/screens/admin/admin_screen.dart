import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/admin/section/header_section_admin_panel.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HeaderSectionAdminPanel(
              userName: "Djordje Tovilovic",
                userRole: "Admin",
                notificationButton: () => context.go("/details"),
                imageUrl:
                    "https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fwww.gravatar.com%2Favatar%2F2c7d99fe281ecd3bcd65ab915bac6dd5%3Fs%3D250"),
          ],
        ),
      ),
    );
  }
}
