import 'package:json_annotation/json_annotation.dart';
import 'package:real_estate_admin/features/real_estate/data/models/city_nested.dart';
part 'office.g.dart';

@JsonSerializable(explicitToJson: true)
class Office {
  final int? id;
  final String? name;
  final String? address;
  final String? cityDescription;
  final String? cityDescriptionEn;
  final String? cityDescriptionDe;
  final String? imageUrl;
  final CityNested? city;

  Office({
    this.id,
    this.name,
    this.address,
    this.cityDescription,
    this.cityDescriptionEn,
    this.cityDescriptionDe,
    this.imageUrl,
    this.city,
  });

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeToJson(this);
}
