import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

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
          // Dodaj naslov i dugme za expand/collapse
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Revenue",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
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
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            "↑ 4.9%",
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.green,
                ),
          ),
          if (isExpanded) ...[
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}
