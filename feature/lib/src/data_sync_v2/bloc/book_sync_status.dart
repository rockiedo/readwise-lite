import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_sync_status.freezed.dart';

@freezed
class BookSyncStatus with _$BookSyncStatus {
  const factory BookSyncStatus(
    int bookId,
    String bookTitle,
    String coverImageUrl,
    int totalHighlightCount,
    int fetchedHighlightCount,
    String updatedAt,
  ) = _BookSyncStatus;
}
