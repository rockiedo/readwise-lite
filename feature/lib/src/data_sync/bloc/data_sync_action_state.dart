import 'package:feature/src/data_sync/bloc/data_sync_action.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_sync_action_state.freezed.dart';

@freezed
class DataSyncActionState with _$DataSyncActionState {
  const factory DataSyncActionState({
    required DataSyncAction action,
  }) = _DataSyncActionState;
}
