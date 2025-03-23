import 'package:json_annotation/json_annotation.dart';

part 'login_user_response.g.dart';

@JsonSerializable()
class LoginUserResponse {
  final String authToken;
  final String refreshToken;

  LoginUserResponse({
    required this.authToken,
    required this.refreshToken,
  });

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserResponseToJson(this);
}
