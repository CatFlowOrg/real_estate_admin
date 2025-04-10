import 'package:json_annotation/json_annotation.dart';
import 'package:real_estate_admin/features/real_estate/data/models/office.dart';

part 'agent.g.dart';

@JsonSerializable(explicitToJson: true)
class Agent {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? title;
  final String? descriptionDe;
  final bool? isActive;
  final String? email;
  final String? phone;
  final String? imageUrl;
  final String? role;
  final String? description;
  final String? descriptionEn;
  final Office? office;

  Agent({
    this.id,
    this.firstName,
    this.lastName,
    this.title,
    this.descriptionDe,
    this.isActive,
    this.email,
    this.phone,
    this.imageUrl,
    this.role,
    this.description,
    this.descriptionEn,
    this.office,
  });

  factory Agent.fromJson(Map<String, dynamic> json) =>
      _$AgentFromJson(json);

  Map<String, dynamic> toJson() => _$AgentToJson(this);
}
