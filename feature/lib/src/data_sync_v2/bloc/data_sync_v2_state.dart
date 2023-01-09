import 'package:core_model/core_model.dart';
import 'package:feature/src/data_sync_v2/bloc/data_sync_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_sync_v2_state.freezed.dart';

@freezed
class DataSyncV2State with _$DataSyncV2State {
  const factory DataSyncV2State(
    DataSyncStatus status, {
    List<Book>? books,
    String? lastSync,
    int? fetchProgress,
  }) = _DataSyncV2State;
}
