import 'package:json_annotation/json_annotation.dart';
part 'city_nested.g.dart';

@JsonSerializable()
class CityNested {
  final int? id;
  final String? name;

  CityNested({
    this.id,
    this.name,
  });

  factory CityNested.fromJson(Map<String, dynamic> json) =>
      _$CityNestedFromJson(json);

  Map<String, dynamic> toJson() => _$CityNestedToJson(this);
}
