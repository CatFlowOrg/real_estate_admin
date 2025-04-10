import 'package:json_annotation/json_annotation.dart';
part 'real_estate_image.g.dart';

@JsonSerializable()
class RealEstateImage {
  final int? id;
  final String? title;
  final String? url;
  final int? order;
  final bool? isPublic;

  RealEstateImage({
    this.id,
    this.title,
    this.url,
    this.order,
    this.isPublic,
  });

  factory RealEstateImage.fromJson(Map<String, dynamic> json) =>
      _$RealEstateImageFromJson(json);

  Map<String, dynamic> toJson() => _$RealEstateImageToJson(this);
}

