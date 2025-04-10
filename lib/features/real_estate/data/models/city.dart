import 'package:json_annotation/json_annotation.dart';
import 'package:real_estate_admin/features/real_estate/data/models/region.dart';
part 'city.g.dart';

@JsonSerializable(explicitToJson: true)
class City {
  final int? id;
  final String? name;
  final Region? region;

  City({
    this.id,
    this.name,
    this.region,
  });

  factory City.fromJson(Map<String, dynamic> json) =>
      _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
