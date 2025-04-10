import 'package:json_annotation/json_annotation.dart';
part 'translation.g.dart';

@JsonSerializable()
class Translation {
  final int id;
  final int language;
  final String? title;
  final String? slug;
  final String? description;
  final String? keyword;
  final String? metaDescription;
  final List<dynamic> domainEvents;

  Translation({
    required this.id,
    required this.language,
    this.title,
    this.slug,
    this.description,
    this.keyword,
    this.metaDescription,
    required this.domainEvents,
  });

  factory Translation.fromJson(Map<String, dynamic> json) =>
      _$TranslationFromJson(json);

  Map<String, dynamic> toJson() => _$TranslationToJson(this);
}
