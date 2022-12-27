import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_sync_state.freezed.dart';

@freezed
class BookSyncState with _$BookSyncState {
  const factory BookSyncState({
    required int bookId,
    required String bookTitle,
    String? coverUrl,
  }) = _BookSyncState;
}