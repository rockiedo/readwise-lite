import 'package:core_data/core_data.dart';
import 'package:core_model/core_model.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetLocalBooksUseCase {
  final BookRepository _bookRepository;

  GetLocalBooksUseCase(this._bookRepository);

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
