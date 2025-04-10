import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:real_estate_admin/core/ui/app_text_styles.dart';

class HtmlTextPreview extends StatelessWidget {
  final String htmlContent;

  const HtmlTextPreview({
    super.key,
    required this.htmlContent,
  });

  @override
  Widget build(BuildContext context) {
    final document = html_parser.parse(htmlContent);
    final plainText = document.body?.text ?? '';

    return Text(
      plainText,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style:AppTextStyles.descText(context),
    );
  }
}
