import 'package:core_data/core_data.dart';
import 'package:injectable/injectable.dart';

abstract class FetchBooksUseCase {
  Future invoke();
}

@Injectable(as: FetchBooksUseCase)
class FetchBooksUseCaseImpl extends FetchBooksUseCase {
  final BookRepository bookRepository;
  final SyncLogRepository syncLogRepository;

  FetchBooksUseCaseImpl(this.bookRepository, this.syncLogRepository);

  @override
  Future invoke() async {
    final lastSync = await syncLogRepository.loadLastAllBooksSync();
    await bookRepository.fetchBooks(lastSync);
    return syncLogRepository.storeLastAllBooksSync(
      DateTime.now().toIso8601String(),
    );
  }
}
