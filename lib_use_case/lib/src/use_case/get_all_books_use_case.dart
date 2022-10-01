import 'package:core_data/core_data.dart';
import 'package:core_model/core_model.dart';
import 'package:injectable/injectable.dart';

abstract class GetAllBooksUseCase {
  Future<List<Book>> getAllBooksSingle();
}

@Injectable(as: GetAllBooksUseCase)
class GetAllBooksUseCaseImpl extends GetAllBooksUseCase {
  final BookRepository bookRepository;

  GetAllBooksUseCaseImpl(this.bookRepository);

  @override
  Future<List<Book>> getAllBooksSingle() {
    return bookRepository.getAllBooksSingle();
  }
}