import 'package:json_annotation/json_annotation.dart';

part 'hashtag.g.dart';

@JsonSerializable()
class Hashtag {
  final int id;
  final String name;
  final String? nameCro;
  final String? nameDe;
  final String? nameRu;
  final bool isActive;

  Hashtag({
    required this.id,
    required this.name,
    this.nameCro,
    this.nameDe,
    this.nameRu,
    required this.isActive,
  });

  factory Hashtag.fromJson(Map<String, dynamic> json) => _$HashtagFromJson(json);
  Map<String, dynamic> toJson() => _$HashtagToJson(this);
}
