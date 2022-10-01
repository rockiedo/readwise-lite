// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkBook _$NetworkBookFromJson(Map<String, dynamic> json) => NetworkBook(
      id: json['id'] as int,
      title: json['title'] as String,
      author: json['author'] as String?,
      category: json['category'] as String,
      source: json['source'] as String,
      numHighlights: json['num_highlights'] as int,
      lastHighlightAt: json['last_highlight_at'] as String?,
      updated: json['updated'] as String,
      coverImageUrl: json['cover_image_url'] as String,
      highlightsUrl: json['highlights_url'] as String,
      sourceUrl: json['source_url'] as String?,
      asin: json['asin'] as String?,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NetworkBookToJson(NetworkBook instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'category': instance.category,
      'source': instance.source,
      'num_highlights': instance.numHighlights,
      'last_highlight_at': instance.lastHighlightAt,
      'updated': instance.updated,
      'cover_image_url': instance.coverImageUrl,
      'highlights_url': instance.highlightsUrl,
      'source_url': instance.sourceUrl,
      'asin': instance.asin,
      'tags': instance.tags,
    };
