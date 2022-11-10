// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_highlights_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHighlightsResponse _$GetHighlightsResponseFromJson(
        Map<String, dynamic> json) =>
    GetHighlightsResponse(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => NetworkHighlight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetHighlightsResponseToJson(
        GetHighlightsResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
