// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessTokenEntity _$AccessTokenEntityFromJson(Map<String, dynamic> json) =>
    AccessTokenEntity(
      token: json['token'] as String,
      alias: json['alias'] as String,
      isActive: json['is_active'] as int,
    );

Map<String, dynamic> _$AccessTokenEntityToJson(AccessTokenEntity instance) =>
    <String, dynamic>{
      'token': instance.token,
      'alias': instance.alias,
      'is_active': instance.isActive,
    };
