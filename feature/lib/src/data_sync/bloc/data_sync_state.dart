import 'package:freezed_annotation/freezed_annotation.dart';

import 'book_sync_state.dart';

part 'data_sync_state.freezed.dart';

@freezed
class DataSyncState with _$DataSyncState {
  const factory DataSyncState({
    required List<BookSyncState> bookStates,
    required bool isDownloadingBooks,
  }) = _DataSyncState;
}