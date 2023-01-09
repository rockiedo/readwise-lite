import 'package:core_data/core_data.dart';
import 'package:core_model/core_model.dart';
import 'package:injectable/injectable.dart';

abstract class GetLocalBooksUseCase {
  Future<List<Book>> invoke();
}

@Injectable(as: GetLocalBooksUseCase)
class GetLocalBooksUseCaseImpl extends GetLocalBooksUseCase {
  final BookRepository _bookRepository;

  GetLocalBooksUseCaseImpl(this._bookRepository);

  @override
  Future<List<Book>> invoke() async {
    final entities = await _bookRepository.loadBooks();
    entities.sort(
      (a, b) {
        final asc =
            DateTime.parse(a.updated).compareTo(DateTime.parse(b.updated));
        return -asc;
      },
    );
    return entities.map((e) => e.toExternalModel()).toList();
  }
}
