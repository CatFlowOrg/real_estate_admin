import 'package:json_annotation/json_annotation.dart';
import 'package:real_estate_admin/features/real_estate/data/models/region.dart';


class CityLocation {
  final int? id;
  final String? name;
  final String? region;
  final String? country;

  CityLocation({
    this.id,
    this.name,
    this.region,
    this.country
  });

}
