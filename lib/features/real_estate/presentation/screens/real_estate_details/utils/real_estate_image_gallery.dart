import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_admin/features/real_estate/data/models/real_estate_image.dart';

class RealEstateImageGallery extends StatelessWidget {
  final List<RealEstateImage> images;

  const RealEstateImageGallery({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    final total = images.length;

    if (total == 0) return const SizedBox();

    if (total == 1) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildImage(context, images[0].url),
      );
    }

    if (total == 2) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(child: _buildImage(context, images[0].url)),
            const SizedBox(width: 8),
            Expanded(child: _buildImage(context, images[1].url)),
          ],
        ),
      );
    }

    if (total == 3) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: _buildImage(context, images[0].url)),
                const SizedBox(width: 8),
                Expanded(child: _buildImage(context, images[1].url)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _buildImage(context, images[2].url)),
              ],
            ),
          ],
        ),
      );
    }

    if (total == 4) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: _buildImage(context, images[0].url)),
                const SizedBox(width: 8),
                Expanded(child: _buildImage(context, images[1].url)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _buildImage(context, images[2].url)),
                const SizedBox(width: 8),
                Expanded(child: _buildImage(context, images[3].url)),
              ],
            ),
          ],
        ),
      );
    }

    // više od 5 – Booking-style prikaz
    final firstImages = images.take(5).toList();
    final remainingCount = images.length - 5;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildImage(context, firstImages[0].url)),
              const SizedBox(width: 8),
              Expanded(child: _buildImage(context, firstImages[1].url)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(3, (index) {
              final imgIndex = index + 2;
              final hasImage = imgIndex < firstImages.length;
              final url = hasImage ? firstImages[imgIndex].url : null;
              final isLast = index == 2;
              final padding = EdgeInsets.only(right: index < 2 ? 8.0 : 0);

              return Expanded(
                child: Padding(
                  padding: padding,
                  child: isLast
                      ? Stack(
                    children: [
                      _buildImage(context, url),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '+$remainingCount more',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                      : _buildImage(context, url),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, String? url) {
    final placeholder =
        "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg";

    return GestureDetector(
      onTap: () {
        context.push('/editImage');
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (_) => Dialog(
            backgroundColor: Colors.black,
            insetPadding: const EdgeInsets.all(10),
            child: InteractiveViewer(
              child: Image.network(
                url ?? placeholder,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            url ?? placeholder,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
