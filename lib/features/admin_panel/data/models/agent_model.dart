import 'package:json_annotation/json_annotation.dart';

part 'agent_model.g.dart';

@JsonSerializable()
class AgentModel {
  final int id;
  final String firstName;
  final String lastName;
  final String? title;
  final bool isActive;
  final String email;
  final String? phone;
  final String? imageUrl;
  final String? role;
  final String? description;
  final String? descriptionEn;
  final String? descriptionDe;
  final String officeName;

  AgentModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.title,
    required this.isActive,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.role,
    this.description,
    this.descriptionEn,
    this.descriptionDe,
    required this.officeName,
  });

  factory AgentModel.fromJson(Map<String, dynamic> json) =>
      _$AgentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AgentModelToJson(this);
}