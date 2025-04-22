import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:real_estate_admin/core/ui/app_text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TotalRevenueCard extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggleExpanded;

  const TotalRevenueCard({
    super.key,
    required this.isExpanded,
    required this.onToggleExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.total_revenue,
                style: AppTextStyles.nameText(context),
              ),
              InkWell(
                onTap: onToggleExpanded,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    isExpanded
                        ? Symbols.close_fullscreen
                        : Symbols.open_in_full,
                    size: 20,
                    weight: 300,
                    fill: 0,
                    color: Colors.black45,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "\$324,424,693",
            style: AppTextStyles.widgetText(context),
          ),
          const SizedBox(height: 4),
          Text(
            "↑ 4.9%",
            style: AppTextStyles.percentageText(context),
          ),
          if (isExpanded) ...[
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}
