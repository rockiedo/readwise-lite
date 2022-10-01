// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_books_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBooksResponse _$GetBooksResponseFromJson(Map<String, dynamic> json) =>
    GetBooksResponse(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => NetworkBook.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBooksResponseToJson(GetBooksResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
