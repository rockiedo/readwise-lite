import 'package:core_data/core_data.dart';
import 'package:injectable/injectable.dart';

abstract class FetchHighlightsFromBookUseCase {
  Future invoke(int bookId);
}

const _syncThresholdMinutes = 5;

@Injectable(as: FetchHighlightsFromBookUseCase)
class FetchHighlightsFromBookUseCaseImpl
    extends FetchHighlightsFromBookUseCase {
  final HighlightRepository _highlightRepository;
  final SyncLogRepository _syncRepository;

  FetchHighlightsFromBookUseCaseImpl(
    this._highlightRepository,
    this._syncRepository,
  );

  @override
  Future invoke(int bookId) async {
    final lastSync = await _syncRepository.loadLastHighlightsSync(bookId);
    if (!_shouldFetch(lastSync)) return;
    await _highlightRepository.fetchHighlightsFromBook(bookId, lastSync);
  }

  bool _shouldFetch(String? lastSync) {
    if (lastSync == null) return true;

    final threshold = DateTime.now().subtract(
      const Duration(minutes: _syncThresholdMinutes),
    );
    final lastSyncDateTime = DateTime.parse(lastSync);

    return lastSyncDateTime.isBefore(threshold);
  }
}
