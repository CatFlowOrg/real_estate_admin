import 'package:flutter/material.dart';
import 'package:real_estate_admin/core/theme/app_colors.dart';

class AppTextStyles {
  static TextStyle headerText(BuildContext context) {
    return const TextStyle(
      fontSize: 18,
      fontFamily: "Inter",
      fontWeight: FontWeight.w500,
      letterSpacing: -0.5,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle titleText(BuildContext context) {
    return const TextStyle(
      fontSize: 18,
      fontFamily: "Inter",
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle widgetText(BuildContext context) {
    return const TextStyle(
      fontSize: 32,
      fontFamily: "Inter",
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle subtitleText(BuildContext context) {
    return const TextStyle(
      fontSize: 18,
      fontFamily: "Inter",
      fontWeight: FontWeight.w500,
      height: 14,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle bodyText(BuildContext context) {
    return const TextStyle(
      fontSize: 18,
      fontFamily: "Inter",
      fontWeight: FontWeight.w500,
      height: 14,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle smallText(BuildContext context) {
    return const TextStyle(
      fontSize: 18,
      fontFamily: "Inter",
      fontWeight: FontWeight.w500,
      height: 14,
      color: AppColors.textPrimary,
    );
  }
}
