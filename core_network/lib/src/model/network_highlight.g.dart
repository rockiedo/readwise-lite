// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_highlight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkHighlight _$NetworkHighlightFromJson(Map<String, dynamic> json) =>
    NetworkHighlight(
      id: json['id'] as int,
      text: json['text'] as String,
      note: json['note'] as String?,
      location: json['location'] as int,
      locationType: json['location_type'] as String,
      highlightedAt: json['highlighted_at'] as String,
      url: json['url'] as String?,
      color: json['color'] as String?,
      updated: json['updated'] as String?,
      bookId: json['book_id'] as String,
    );

Map<String, dynamic> _$NetworkHighlightToJson(NetworkHighlight instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'note': instance.note,
      'location': instance.location,
      'location_type': instance.locationType,
      'highlighted_at': instance.highlightedAt,
      'url': instance.url,
      'color': instance.color,
      'updated': instance.updated,
      'book_id': instance.bookId,
    };
