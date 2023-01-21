import 'package:core_data/core_data.dart';
import 'package:core_model/core_model.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FetchBooksUseCase {
  final BookRepository _bookRepository;
  final SyncLogRepository _syncLogRepository;

  FetchBooksUseCase(this._bookRepository, this._syncLogRepository);

  Future<List<Book>> invoke() async {
    final lastSync = await _syncLogRepository.loadLastAllBooksSync();
    final bookEntities = await _bookRepository.fetchBooks(lastSync);

    await _syncLogRepository.storeLastAllBooksSync(
      DateTime.now().toIso8601String(),
    );

    return bookEntities.map((e) => e.toExternalModel()).toList();
  }
}
