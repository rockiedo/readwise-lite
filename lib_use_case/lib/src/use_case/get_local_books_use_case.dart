import 'package:core_data/core_data.dart';
import 'package:core_model/core_model.dart';
import 'package:injectable/injectable.dart';

abstract class GetLocalBooksUseCase {
  Future<List<Book>> invoke();
}

@Injectable(as: GetLocalBooksUseCase)
class GetLocalBooksUseCaseImpl extends GetLocalBooksUseCase {
  final BookRepository bookRepository;

  GetLocalBooksUseCaseImpl(this.bookRepository);
  
  @override
  Future<List<Book>> invoke() async {
    final entities = await bookRepository.getLocalBooks();
    return entities.map((e) => e.toExternalModel()).toList();
  }
}