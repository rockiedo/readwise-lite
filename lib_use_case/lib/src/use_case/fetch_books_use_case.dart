import 'package:core_data/core_data.dart';
import 'package:core_model/core_model.dart';
import 'package:injectable/injectable.dart';

abstract class FetchBooksUseCase {
  Future<List<Book>> invoke();
}

@Injectable(as: FetchBooksUseCase)
class FetchBooksUseCaseImpl extends FetchBooksUseCase {
  final BookRepository bookRepository;
  final SyncLogRepository syncLogRepository;

  FetchBooksUseCaseImpl(this.bookRepository, this.syncLogRepository);

  @override
  Future<List<Book>> invoke() async {
    final lastSync = await syncLogRepository.loadLastAllBooksSync();
    final bookEntities = await bookRepository.fetchBooks(lastSync);

    await syncLogRepository.storeLastAllBooksSync(
      DateTime.now().toIso8601String(),
    );

    return bookEntities.map((e) => e.toExternalModel()).toList();
  }
}
