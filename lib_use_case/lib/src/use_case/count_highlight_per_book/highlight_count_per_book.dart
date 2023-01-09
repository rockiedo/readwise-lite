import 'package:freezed_annotation/freezed_annotation.dart';

part 'highlight_count_per_book.g.dart';

@JsonSerializable()
class HighlightCountPerBook {
  @JsonKey(name: 'book_id')
  final int bookId;
  @JsonKey(name: 'count')
  final int count;

  const HighlightCountPerBook({
    required this.bookId,
    required this.count,
  });

  Map<String, dynamic> toJson() => _$HighlightCountPerBookToJson(this);

  factory HighlightCountPerBook.fromJson(Map<String, dynamic> json) =>
      _$HighlightCountPerBookFromJson(json);
}
