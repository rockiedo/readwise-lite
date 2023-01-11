import 'package:core_data/core_data.dart';
import 'package:injectable/injectable.dart';

abstract class FetchHighlightsFromBookUseCase {
  Future invoke(int bookId);
}

@Injectable(as: FetchHighlightsFromBookUseCase)
class FetchHighlightsFromBookUseCaseImpl
    extends FetchHighlightsFromBookUseCase {
  final HighlightRepository _highlightRepository;

  FetchHighlightsFromBookUseCaseImpl(this._highlightRepository);

  @override
  Future invoke(int bookId) async {
    await _highlightRepository.fetchHighlightsFromBook(bookId);
  }
}
