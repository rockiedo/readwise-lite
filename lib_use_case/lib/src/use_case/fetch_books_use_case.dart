import 'package:core_data/core_data.dart';
import 'package:injectable/injectable.dart';

abstract class FetchBooksUseCase {
  Future invoke(String? lastSync);
}

@Injectable(as: FetchBooksUseCase)
class FetchBooksUseCaseImpl extends FetchBooksUseCase {
  final BookRepository bookRepository;

  FetchBooksUseCaseImpl(this.bookRepository);

  @override
  Future invoke(String? lastSync) {
    return bookRepository.fetchBooks(lastSync);
  }
}
