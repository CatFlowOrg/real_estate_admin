import 'package:json_annotation/json_annotation.dart';
import 'package:real_estate_admin/features/real_estate/data/models/region.dart';
part 'city_with_region.g.dart';

@JsonSerializable(explicitToJson: true)
class CityWithRegion {
  final int? id;
  final String? name;
  final Region? region;

  CityWithRegion({
    this.id,
    this.name,
    this.region,
  });

  factory CityWithRegion.fromJson(Map<String, dynamic> json) =>
      _$CityWithRegionFromJson(json);

  Map<String, dynamic> toJson() => _$CityWithRegionToJson(this);
}
