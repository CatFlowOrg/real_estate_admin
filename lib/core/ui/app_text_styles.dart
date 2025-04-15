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

  static TextStyle nameText(BuildContext context) {
    return const TextStyle(
      fontSize: 17,
      fontFamily: "Inter",
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle roleText(BuildContext context) {
    return const TextStyle(
      fontSize: 12,
      fontFamily: "Inter",
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
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
      fontSize: 30,
      fontFamily: "Inter",
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle subtitleText(BuildContext context) {
    return const TextStyle(
      fontSize: 16,
      fontFamily: "Inter",
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle bodyText(BuildContext context) {
    return const TextStyle(
      fontSize: 18,
      fontFamily: "Inter",
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle smallText(BuildContext context) {
    return const TextStyle(
      fontSize: 14,
      fontFamily: "Inter",
      fontWeight: FontWeight.w300,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle listText(BuildContext context) {
    return const TextStyle(
      fontSize: 14,
      fontFamily: "Inter",
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle percentageText(BuildContext context,
      {Color color = Colors.green}) {
    return TextStyle(
      fontSize: 12,
      fontFamily: "Inter",
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle percentageTextBrown(BuildContext context, {Color color = const Color(0xFF9C644E)}) {
    return TextStyle(
      fontSize: 12,
      fontFamily: "Inter",
      fontWeight: FontWeight.w500,
      color: color,
    );
  }


  static TextStyle descText(BuildContext context) {
    return const TextStyle(
      fontSize: 12,
      fontFamily: "Inter",
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    );
  }
}
