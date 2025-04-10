import 'package:json_annotation/json_annotation.dart';
part 'owner_detail.g.dart';

@JsonSerializable()
class OwnerDetail {
  final int? id;
  final String? fullName;
  final String? address;
  final String? email;
  final String? phone;
  final String? cadestralMark;
  final String? note;
  final String? agreedCommission;
  final String? mediationAgreementUrl;

  OwnerDetail({
    this.id,
    this.fullName,
    this.address,
    this.email,
    this.phone,
    this.cadestralMark,
    this.note,
    this.agreedCommission,
    this.mediationAgreementUrl,
  });

  factory OwnerDetail.fromJson(Map<String, dynamic> json) =>
      _$OwnerDetailFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerDetailToJson(this);
}

