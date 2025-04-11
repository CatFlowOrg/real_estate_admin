import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? identityId;
  final String? title;
  final bool? isActive;
  final String? email;
  final String? phone;
  final String? imageUrl;
  final String? role;
  final int? officeId;
  final int? userGroup;

  UserResponse({
     this.id,
     this.firstName,
     this.lastName,
     this.identityId,
     this.title,
     this.isActive,
     this.email,
     this.phone,
     this.imageUrl,
     this.role,
     this.officeId,
     this.userGroup,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
