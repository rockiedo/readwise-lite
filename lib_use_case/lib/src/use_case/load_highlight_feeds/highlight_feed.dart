import 'package:json_annotation/json_annotation.dart';

part 'highlight_feed.g.dart';

@JsonSerializable()
class HighlightFeed {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'book_id')
  final int bookId;
  @JsonKey(name: 'author')
  final String? author;
  @JsonKey(name: 'text')
  final String text;

  const HighlightFeed({
    required this.id,
    required this.bookId,
    required this.author,
    required this.text,
  });

  Map<String, dynamic> toJson() => _$HighlightFeedToJson(this);

  factory HighlightFeed.fromJson(Map<String, dynamic> json) =>
      _$HighlightFeedFromJson(json);
}