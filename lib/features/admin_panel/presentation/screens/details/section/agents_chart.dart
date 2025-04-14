import 'package:flutter/material.dart';

class AgentChart extends StatelessWidget {
  const AgentChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          "Chart Placeholder",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black38,
              ),
        ),
      ),
    );
  }
}
