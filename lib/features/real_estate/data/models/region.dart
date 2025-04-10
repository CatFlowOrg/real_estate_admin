import 'package:json_annotation/json_annotation.dart';
part 'region.g.dart';

@JsonSerializable()
class Region {
  final int? id;
  final String? name;

  Region({
    this.id,
    this.name,
  });

  factory Region.fromJson(Map<String, dynamic> json) =>
      _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
