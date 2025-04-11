import 'package:json_annotation/json_annotation.dart';

part 'permit.g.dart';

@JsonSerializable()
class Permit {
  final int id;
  final String name;
  final String? nameCro;
  final String? nameDe;
  final String? nameRu;

  Permit({
    required this.id,
    required this.name,
    this.nameCro,
    this.nameDe,
    this.nameRu,
  });

  factory Permit.fromJson(Map<String, dynamic> json) => _$PermitFromJson(json);
  Map<String, dynamic> toJson() => _$PermitToJson(this);
}
