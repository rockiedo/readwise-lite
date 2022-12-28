// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_log_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncLogEntity _$SyncLogEntityFromJson(Map<String, dynamic> json) =>
    SyncLogEntity(
      bookId: json['book_id'] as int,
      lastSync: json['last_sync'] as String?,
    );

Map<String, dynamic> _$SyncLogEntityToJson(SyncLogEntity instance) =>
    <String, dynamic>{
      'book_id': instance.bookId,
      'last_sync': instance.lastSync,
    };
