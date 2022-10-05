import 'package:json_annotation/json_annotation.dart';

part 'book_entity.g.dart';

@JsonSerializable()
class BookEntity {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'author')
  final String? author;
  @JsonKey(name: 'category')
  final String category;
  @JsonKey(name: 'source')
  final String source;
  @JsonKey(name: 'num_highlights')
  final int numHighlights;
  @JsonKey(name: 'last_highlight_at')
  final String? lastHighlightAt;
  @JsonKey(name: 'updated')
  final String updated;
  @JsonKey(name: 'cover_image_url')
  final String coverImageUrl;
  @JsonKey(name: 'highlights_url')
  final String highlightsUrl;
  @JsonKey(name: 'source_url')
  final String? sourceUrl;
  @JsonKey(name: 'access_token')
  final String accessToken;

  const BookEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.source,
    required this.numHighlights,
    required this.lastHighlightAt,
    required this.updated,
    required this.coverImageUrl,
    required this.highlightsUrl,
    required this.sourceUrl,
    required this.accessToken,
  });

  factory BookEntity.fromJson(Map<String, dynamic> json) => _$BookEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BookEntityToJson(this);
}
