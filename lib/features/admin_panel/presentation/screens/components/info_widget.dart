import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:real_estate_admin/core/ui/app_text_styles.dart';

enum InfoWidgetSize {
  small,
  big,
}

class InfoWidget extends StatelessWidget {
  final InfoWidgetSize size;
  final String name, number;
  final VoidCallback buttonExpand;

  const InfoWidget({
    super.key,
    required this.size,
    required this.name,
    required this.number,
    required this.buttonExpand,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    const double horizontalSpacing = 16;

    const double horizontalPadding = 32;

    final double widgetWidth = size == InfoWidgetSize.big
        ? screenWidth - horizontalPadding
        : (screenWidth - horizontalPadding - horizontalSpacing) / 2;

    return Container(
      width: widgetWidth,
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEFEFEF)),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),

      child: Padding(
        padding: const EdgeInsets.only(left: 12,top: 8,right: 8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: AppTextStyles.titleText(context),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFE8E8E8),
                      width: 1,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent, 
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: buttonExpand,
                      child: const Center(
                        child: Icon(Symbols.expand_content, size: 20, color: Color(0xFF666666)),
                      ),
                    ),
                  ),
                )

              ],
            ),
            const SizedBox(height: 8),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                number,
                style: AppTextStyles.widgetText(context),
              ),
            ),
            Image.asset(
              'assets/img/img.png',
              height: 30,
              fit: BoxFit.contain,
            )
          ],
        ),
      ),
    );
  }
}
