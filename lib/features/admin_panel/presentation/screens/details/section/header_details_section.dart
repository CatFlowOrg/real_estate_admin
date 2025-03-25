import 'package:flutter/material.dart';

class HeaderDetailsSection extends StatelessWidget {
  final String name;
  final String number;
  const HeaderDetailsSection({super.key, required this.name, required this.number});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 150,
      child:
      Column(
        children: [
          Text(name)
        ],
      ),
    );
  }
}
