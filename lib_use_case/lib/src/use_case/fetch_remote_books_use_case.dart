import 'package:core_data/core_data.dart';
import 'package:injectable/injectable.dart';

abstract class FetchRemoteBooksUseCase {
  Future invoke(String? lastSync);
}

@Injectable(as: FetchRemoteBooksUseCase)
class FetchAllBooksUseCaseImpl extends FetchRemoteBooksUseCase {
  final BookRepository bookRepository;

  FetchAllBooksUseCaseImpl(this.bookRepository);

  @override
  Future invoke(String? lastSync) {
    return bookRepository.fetchBooks(lastSync);
  }
}
