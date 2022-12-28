// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highlight_feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HighlightFeed _$HighlightFeedFromJson(Map<String, dynamic> json) =>
    HighlightFeed(
      id: json['id'] as int,
      bookId: json['book_id'] as int,
      author: json['author'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$HighlightFeedToJson(HighlightFeed instance) =>
    <String, dynamic>{
      'id': instance.id,
      'book_id': instance.bookId,
      'author': instance.author,
      'text': instance.text,
    };
