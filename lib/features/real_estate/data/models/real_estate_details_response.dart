import 'package:json_annotation/json_annotation.dart';
import 'package:real_estate_admin/features/real_estate/data/models/feature.dart';
import 'package:real_estate_admin/features/real_estate/data/models/hashtag.dart';
import 'package:real_estate_admin/features/real_estate/data/models/permit.dart';
import 'package:real_estate_admin/features/real_estate/data/models/agent.dart';
import 'package:real_estate_admin/features/real_estate/data/models/city.dart';
import 'package:real_estate_admin/features/real_estate/data/models/neighborhood.dart';
import 'package:real_estate_admin/features/real_estate/data/models/owner.dart';
import 'package:real_estate_admin/features/real_estate/data/models/owner_detail.dart';
import 'package:real_estate_admin/features/real_estate/data/models/real_estate_image.dart';
import 'package:real_estate_admin/features/real_estate/data/models/translation.dart';


part 'real_estate_details_response.g.dart';

@JsonSerializable(explicitToJson: true)
class RealEstateDetailsResponse {
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
  final int? numberOfBathrooms;
  final int? numberOfWcs;
  final String? keyword;
  final String? metaDescription;
  final String? video;
  final String? virtualReality;
  final String? exposeUrl;
  final String? floor;
  final int? buildingFloorNumber;
  final int? parkingSpots;
  final int? distanceToSea;
  final int? distanceToCenter;
  final String? address;
  final String? cadestralMark;
  final int? state;
  final int? status;

  final int? heatingSource;
  final int? buildingMaterial;
  final int? realEstateSubtype;
  final int? floorType;
  final int? provisionPercent;

  final Agent? agent;
  final Neighborhood? neighborhood;
  final City? city;
  final OwnerDetail? ownerDetail;
  final Owner? owner;

  final List<Translation>? translations;
  final List<RealEstateImage>? images;
  final List<Feature>? features;
  final List<Permit>? permits;
  final List<Hashtag>? hashtags;

  RealEstateDetailsResponse({
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
    this.numberOfBathrooms,
    this.numberOfWcs,
    this.keyword,
    this.metaDescription,
    this.video,
    this.virtualReality,
    this.exposeUrl,
    this.floor,
    this.buildingFloorNumber,
    this.parkingSpots,
    this.distanceToSea,
    this.distanceToCenter,
    this.address,
    this.cadestralMark,
    this.state,
    this.status,
    this.heatingSource,
    this.buildingMaterial,
    this.realEstateSubtype,
    this.floorType,
    this.provisionPercent,
    this.agent,
    this.neighborhood,
    this.city,
    this.ownerDetail,
    this.owner,
    this.translations,
    this.images,
    this.features,
    this.permits,
    this.hashtags,
  });

  factory RealEstateDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$RealEstateDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RealEstateDetailsResponseToJson(this);
}
