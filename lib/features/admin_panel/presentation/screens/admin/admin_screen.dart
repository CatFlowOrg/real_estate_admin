import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reorderables/reorderables.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/admin/section/header_section_admin_panel.dart';
import '../components/info_widget.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  List<Map<String, dynamic>> data = [
    {"id": 0, "name": "Total Revenue", "number": "\$324,424,693","size": InfoWidgetSize.big},
    {"id": 1, "name": "Total Agents", "number": "27", "size": InfoWidgetSize.small},
    {"id": 2, "name": "Total Projects", "number": "452", "size": InfoWidgetSize.small},
    {"id": 3, "name": "Total Task", "number": "341", "size": InfoWidgetSize.big},
    {"id": 4, "name": "Total", "number": "\$324,424,693", "size": InfoWidgetSize.big},
  ];

  late List<Widget> _items;

  @override
  void initState() {
    super.initState();
    _items = _buildItems();
  }

  List<Widget> _buildItems() {
    return data.map((mapItem) {
      return InfoWidget(
        key: ValueKey(mapItem["id"]),
        size: mapItem["size"],
        name: mapItem["name"],
        number: mapItem["number"],
        buttonExpand: () {
          context.push('/details');
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Header
            HeaderSectionAdminPanel(
                userName: "Djordje Tovilovic",
                userRole: "Admin",
                notificationButton: () => context.push("/details"),
                addWidgetButton: () => context.push("/add_widget"),
                imageUrl: "https://lh3.googleusercontent.com/-xRSmv0298o0/AAAAAAAAAAI/AAAAAAAAAAA/ALKGfkmVPd_c4xQR38n-dXQ4avGh-3j39g/photo.jpg?sz=46"
            ),

            Expanded(
              child: ReorderableWrap(
                spacing: 16,
                runSpacing: 16,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: _items,
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    final item = data.removeAt(oldIndex);
                    data.insert(newIndex, item);

                    _items = _buildItems();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
