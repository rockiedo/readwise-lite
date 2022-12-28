import 'package:json_annotation/json_annotation.dart';

part 'sync_log_entity.g.dart';

@JsonSerializable()
class SyncLogEntity {
  @JsonKey(name: 'book_id')
  final int bookId;
  @JsonKey(name: 'last_sync')
  final String? lastSync;

  const SyncLogEntity({
    required this.bookId,
    required this.lastSync,
  });

  factory SyncLogEntity.fromJson(Map<String, dynamic> json) => _$SyncLogEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SyncLogEntityToJson(this);
}
