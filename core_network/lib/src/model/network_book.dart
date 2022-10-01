import 'package:json_annotation/json_annotation.dart';

part 'network_book.g.dart';

@JsonSerializable()
class NetworkBook {
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
  @JsonKey(name: 'asin')
  final String? asin;
  @JsonKey(name: 'tags')
  final List<String> tags;

  NetworkBook({
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
    required this.asin,
    required this.tags,
  });

  factory NetworkBook.fromJson(Map<String, dynamic> json) => _$NetworkBookFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkBookToJson(this);
}