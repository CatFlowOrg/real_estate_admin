import 'package:json_annotation/json_annotation.dart';

part 'auth_me_model.g.dart';

@JsonSerializable()
class AuthMeModel {
  final int id;
  final String firstName;
  final String lastName;
  final String identityId;
  final String title;
  final bool isActive;
  final String email;
  final String phone;
  final String imageUrl;
  final String role;
  final int officeId;
  final int userGroup;

  AuthMeModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.identityId,
    required this.title,
    required this.isActive,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.role,
    required this.officeId,
    required this.userGroup,
  });

  factory AuthMeModel.fromJson(Map<String, dynamic> json) =>
      _$AuthMeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthMeModelToJson(this);
}
