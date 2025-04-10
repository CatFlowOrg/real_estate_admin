import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_admin/core/ui/app_text_styles.dart';
import 'package:real_estate_admin/core/utils/html_parser.dart';
import 'package:real_estate_admin/features/real_estate/data/models/real_estate_item.dart';

class RealEstateItemCard extends StatefulWidget {
  final RealEstateItem item;

  const RealEstateItemCard({super.key, required this.item});

  @override
  State<RealEstateItemCard> createState() => _RealEstateItemCardState();
}

class _RealEstateItemCardState extends State<RealEstateItemCard> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final images = widget.item.images ?? [];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 15.0,
                    backgroundImage: NetworkImage(
                      widget.item.agent?.imageUrl ??
                          "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.agent?.firstName ?? "Nepoznat agent",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.item.agent?.role ?? "Nema uloge",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                timeAgo(widget.item.created),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 12),

          if (images.isNotEmpty) ...[
            CarouselSlider(
              options: CarouselOptions(
                height: 170,
                enableInfiniteScroll: false,
                viewportFraction: 0.95,
                enlargeCenterPage: false,
                padEnds: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: images.map((image) {
                final imageUrl = image.url ??
                    "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg";

                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                return Container(
                  width: 6.0,
                  height: 6.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _current == entry.key ? Colors.black45 : Colors.black12,
                  ),
                );
              }).toList(),
            ),
          ],

          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.bed_rounded,color: Colors.grey,),
                  Text("${widget.item.numberOfRooms ?? "Nepoznato"}",style: AppTextStyles.smallText(context))
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.square_foot_rounded, color: Colors.grey,),
                  Text("${widget.item.squareFootage}",style: AppTextStyles.smallText(context))
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month_rounded,
                    color: Colors.grey,
                  ),
                  Text("${widget.item.constructionYear ?? "Nepoznato"}",style: AppTextStyles.smallText(context))
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.item.title ?? 'No title',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          HtmlTextPreview(htmlContent: widget.item.description!),
          const SizedBox(height: 8),
          Container(
            height: 32,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.item.price ?? 'N/A'} €',
                  style: AppTextStyles.titleText(context),
                ),
                Row(children: [
                  const Icon(Icons.location_on_outlined,size: 14,),
                  const SizedBox(width: 4,),
                  Text(
                    '${widget.item.city?.region?.name ?? 'N/A'} ',
                    style: AppTextStyles.smallText(context),
                  ),
                ]),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 32,
            child: const Divider(),
          ),
        ],
      ),
    );
  }
}

String timeAgo(DateTime created) {
  final now = DateTime.now();
  final difference = now.difference(created);

  if (difference.inSeconds < 60) return 'pre ${difference.inSeconds} sekundi';
  if (difference.inMinutes < 60) return 'pre ${difference.inMinutes} minuta';
  if (difference.inHours < 24) return 'pre ${difference.inHours} sati';
  if (difference.inDays < 7) return 'pre ${difference.inDays} dana';
  final weeks = (difference.inDays / 7).floor();
  return 'pre $weeks nedelja';
}
