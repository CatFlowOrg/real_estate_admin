import 'package:json_annotation/json_annotation.dart';
import 'package:real_estate_admin/features/real_estate/data/models/agent.dart';
import 'package:real_estate_admin/features/real_estate/data/models/city.dart';
import 'package:real_estate_admin/features/real_estate/data/models/neighborhood.dart';
import 'package:real_estate_admin/features/real_estate/data/models/owner.dart';
import 'package:real_estate_admin/features/real_estate/data/models/owner_detail.dart';
import 'package:real_estate_admin/features/real_estate/data/models/real_estate_image.dart';
import 'package:real_estate_admin/features/real_estate/data/models/translation.dart';
part 'real_estate_item.g.dart';
@JsonSerializable(explicitToJson: true)
class RealEstateItem {
  final int id;
  final DateTime created;
  final DateTime lastModified;
  final int? realEstateType;
  final int? listingType;
  final String? title;
  final String? slug;
  final String? description;
  final int? price;
  final int? discountPrice;
  final int? squareFootage;
  final int? constructionYear;
  final int? renovationYear;
  final int? numberOfRooms;
  final String? keyword;
  final int? status;

  final Agent? agent;
  final Neighborhood? neighborhood;
  final City? city;

  final OwnerDetail? ownerDetail;
  final Owner? owner;

  final List<Translation>? translations;
  final List<RealEstateImage>? images;

  final String? cadestralMark;
  final String? address;

  RealEstateItem({
    required this.id,
    required this.created,
    required this.lastModified,
    this.realEstateType,
    this.listingType,
    this.title,
    this.slug,
    this.description,
    this.price,
    this.discountPrice,
    this.squareFootage,
    this.constructionYear,
    this.renovationYear,
    this.numberOfRooms,
    this.keyword,
    this.status,
    this.agent,
    this.neighborhood,
    this.city,
    this.ownerDetail,
    this.owner,
    this.translations,
    this.images,
    this.cadestralMark,
    this.address,
  });

  factory RealEstateItem.fromJson(Map<String, dynamic> json) =>
      _$RealEstateItemFromJson(json);

  Map<String, dynamic> toJson() => _$RealEstateItemToJson(this);
}
