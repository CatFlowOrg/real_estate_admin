import 'package:json_annotation/json_annotation.dart';
import 'package:real_estate_admin/features/real_estate/data/models/real_estate_item.dart';
part 'real_estate_response.g.dart';

@JsonSerializable(explicitToJson: true)
class RealEstateResponse {
  final List<RealEstateItem>? items;
  final int? pageNumber;
  final int? totalPages;
  final int? totalCount;
  final bool? hasPreviousPage;
  final bool? hasNextPage;

  RealEstateResponse({
    this.items,
    this.pageNumber,
    this.totalPages,
    this.totalCount,
    this.hasPreviousPage,
    this.hasNextPage,
  });

  factory RealEstateResponse.fromJson(Map<String, dynamic> json) =>
      _$RealEstateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RealEstateResponseToJson(this);
}
