import 'package:core_data/core_data.dart';
import 'package:core_datastore/core_datastore.dart';
import 'package:injectable/injectable.dart';

abstract class FetchBooksUseCase {
  Future invoke();
}

const _keyLastSync = 'key.last_sync';

@Injectable(as: FetchBooksUseCase)
class FetchBooksUseCaseImpl extends FetchBooksUseCase {
  final BookRepository bookRepository;
  final KeyValueStore keyValueStore;

  FetchBooksUseCaseImpl(this.bookRepository, this.keyValueStore);

  @override
  Future invoke() async {
    final lastSync = await keyValueStore.read(_keyLastSync);
    await bookRepository.fetchBooks(lastSync);
    return keyValueStore.write(_keyLastSync, DateTime.now().toIso8601String());
  }
}
