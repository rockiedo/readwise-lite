// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highlight_count_per_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HighlightCountPerBook _$HighlightCountPerBookFromJson(
        Map<String, dynamic> json) =>
    HighlightCountPerBook(
      bookId: json['book_id'] as int,
      count: json['count'] as int,
    );

Map<String, dynamic> _$HighlightCountPerBookToJson(
        HighlightCountPerBook instance) =>
    <String, dynamic>{
      'book_id': instance.bookId,
      'count': instance.count,
    };
