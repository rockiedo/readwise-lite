import 'package:json_annotation/json_annotation.dart';

part 'network_highlight.g.dart';

@JsonSerializable()
class NetworkHighlight {
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
  final int bookId;

  const NetworkHighlight({
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

  factory NetworkHighlight.fromJson(Map<String, dynamic> json) =>
      _$NetworkHighlightFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkHighlightToJson(this);
}
