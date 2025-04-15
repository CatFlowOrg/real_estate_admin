import 'package:flutter/material.dart';
import 'package:real_estate_admin/core/ui/app_text_styles.dart';

class AgentDetailsHeader extends StatelessWidget {
  final int totalAgents;

  const AgentDetailsHeader({super.key, required this.totalAgents});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Total Agents",
          style: AppTextStyles.nameText(context),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "$totalAgents",
              style: AppTextStyles.widgetText(context)
            ),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF4CC),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "↑ 0%",
                  style: AppTextStyles.percentageTextBrown(context),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
