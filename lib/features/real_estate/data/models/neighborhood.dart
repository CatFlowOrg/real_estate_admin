import 'package:json_annotation/json_annotation.dart';
import 'package:real_estate_admin/features/real_estate/data/models/city_with_region.dart';
part 'neighborhood.g.dart';

@JsonSerializable(explicitToJson: true)
class Neighborhood {
  final int? id;
  final String? name;
  final CityWithRegion? city;

  Neighborhood({
    this.id,
    this.name,
    this.city,
  });

  factory Neighborhood.fromJson(Map<String, dynamic> json) =>
      _$NeighborhoodFromJson(json);

  Map<String, dynamic> toJson() => _$NeighborhoodToJson(this);
}
