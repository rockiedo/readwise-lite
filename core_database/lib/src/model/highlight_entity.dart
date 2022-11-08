import 'package:json_annotation/json_annotation.dart';

part 'highlight_entity.g.dart';

@JsonSerializable()
class HighlightEntity {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'text')
  final String text;
  @JsonKey(name: 'note')
  final String? note;
  @JsonKey(name: 'location')
  final int location;
  @JsonKey(name: 'location_type')
  final String locationType;
  @JsonKey(name: 'highlighted_at')
  final String highlightedAt;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'color')
  final String? color;
  @JsonKey(name: 'updated')
  final String? updated;
  @JsonKey(name: 'book_id')
  final String bookId;

  const HighlightEntity({
    required this.id,
    required this.text,
    required this.note,
    required this.location,
    required this.locationType,
    required this.highlightedAt,
    required this.url,
    required this.color,
    required this.updated,
    required this.bookId,
  });

  factory HighlightEntity.fromJson(Map<String, dynamic> json) => _$HighlightEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HighlightEntityToJson(this);
}
