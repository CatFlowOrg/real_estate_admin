import 'package:json_annotation/json_annotation.dart';

part 'feature.g.dart';

@JsonSerializable()
class Feature {
  final int id;
  final String name;
  final String? nameCro;
  final String? nameDe;
  final String? nameRu;
  final bool isActive;
  final int category;
  final List<int>? realEstateTypes;

  Feature({
    required this.id,
    required this.name,
    this.nameCro,
    this.nameDe,
    this.nameRu,
    required this.isActive,
    required this.category,
    this.realEstateTypes,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => _$FeatureFromJson(json);
  Map<String, dynamic> toJson() => _$FeatureToJson(this);
}
