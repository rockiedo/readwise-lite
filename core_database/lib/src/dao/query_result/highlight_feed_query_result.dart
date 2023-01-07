import 'package:json_annotation/json_annotation.dart';

part 'highlight_feed_query_result.g.dart';

@JsonSerializable()
class HighlightFeedQueryResult {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'book_id')
  final int bookId;
  @JsonKey(name: 'text')
  final String text;
  @JsonKey(name: 'author')
  final String? author;
  @JsonKey(name: 'updated')
  final String updated;

  const HighlightFeedQueryResult({
    required this.id,
    required this.bookId,
    required this.text,
    required this.author,
    required this.updated,
  });

  factory HighlightFeedQueryResult.fromJson(Map<String, dynamic> json) =>
      _$HighlightFeedQueryResultFromJson(json);

  Map<String, dynamic> toJson() => _$HighlightFeedQueryResultToJson(this);
}
