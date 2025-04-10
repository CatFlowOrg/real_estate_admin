import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 10,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 60,
                    height: 8,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 170,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Container(
            width: 200,
            height: 14,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Container(
            width: 100,
            height: 10,
            color: Colors.white,
          ),
          const SizedBox(height: 4),
          Container(
            width: 120,
            height: 10,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
