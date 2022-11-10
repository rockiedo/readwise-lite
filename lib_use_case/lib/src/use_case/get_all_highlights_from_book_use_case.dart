import 'package:core_data/core_data.dart';
import 'package:core_model/core_model.dart';
import 'package:injectable/injectable.dart';

abstract class GetAllHighlightsFromBookUseCase {
  Future<List<Highlight>> getAllHighlightsFromBook(int bookId);
}

@Injectable(as: GetAllHighlightsFromBookUseCase)
class GetAllHighlightsFromBookUseCaseImpl
    extends GetAllHighlightsFromBookUseCase {
  final HighlightRepository highlightRepository;

  GetAllHighlightsFromBookUseCaseImpl(this.highlightRepository);

  @override
  Future<List<Highlight>> getAllHighlightsFromBook(int bookId) {
    return highlightRepository.getHighlightsFromBook(bookId);
  }
}
