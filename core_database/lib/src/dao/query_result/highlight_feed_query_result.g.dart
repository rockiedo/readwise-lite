// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highlight_feed_query_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HighlightFeedQueryResult _$HighlightFeedQueryResultFromJson(
        Map<String, dynamic> json) =>
    HighlightFeedQueryResult(
      id: json['id'] as int,
      bookId: json['book_id'] as int,
      text: json['text'] as String,
      author: json['author'] as String?,
      updated: json['updated'] as String,
    );

Map<String, dynamic> _$HighlightFeedQueryResultToJson(
        HighlightFeedQueryResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'book_id': instance.bookId,
      'text': instance.text,
      'author': instance.author,
      'updated': instance.updated,
    };
