import 'package:flutter/material.dart';

class TotalRevenueCard extends StatelessWidget {
  const TotalRevenueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total Revenue", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text("\$324,424,693", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
          SizedBox(height: 4),
          Text("↑ 4.9%", style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}