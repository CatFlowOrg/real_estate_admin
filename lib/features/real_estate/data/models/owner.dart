import 'package:json_annotation/json_annotation.dart';
part 'owner.g.dart';

@JsonSerializable()
class Owner {
  final int? id;
  final String? fullName;
  final String? email;
  final String? phone;
  final String? note;

  Owner({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.note,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
