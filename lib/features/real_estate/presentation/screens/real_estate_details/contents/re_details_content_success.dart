import 'package:flutter/material.dart';
import 'package:real_estate_admin/features/real_estate/data/models/real_estate_details_response.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/real_estate_details/utils/real_estate_image_gallery.dart';

class ReDetailsContentSuccess extends StatelessWidget {
  final RealEstateDetailsResponse response;

  const ReDetailsContentSuccess({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RealEstateImageGallery(images: response.images ?? []),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(response.title ?? 'No title',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineSmall),
                const SizedBox(height: 8),
                Text('Price: €${response.price ?? '-'}'),
                Text('Square Footage: ${response.squareFootage ?? '-'} m²'),
                Text('Address: ${response.address ?? 'No address'}'),
                const SizedBox(height: 16),
                Text('Description:',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium),
                const SizedBox(height: 4),
                Text(response.description ?? 'No description'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}