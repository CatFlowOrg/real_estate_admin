import 'package:flutter/material.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/details/section/header_details_section.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
      SafeArea(
        child: Column(children: [
          HeaderDetailsSection(name: "Total Revenue", number: "231")
        ],),
      ),
    );
  }
}
