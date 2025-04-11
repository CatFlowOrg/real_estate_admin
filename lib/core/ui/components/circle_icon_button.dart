import 'package:flutter/material.dart';

Widget circleIconButton({
  required IconData icon,
  VoidCallback? onPressed,
  double weight = 400,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFEEEEEE),
      ),
      child: Icon(
        icon,
        size: 20,
        weight: weight,
        fill: 0,
        color: Colors.black,
      ),
    ),
  );
}

