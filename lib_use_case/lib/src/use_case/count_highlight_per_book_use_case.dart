import 'package:core_data/core_data.dart';
import 'package:injectable/injectable.dart';

abstract class CountHighlightPerBookUseCase {
  Future<Map<int, int>> invoke();
}

@Injectable(as: CountHighlightPerBookUseCase)
class CountHighlightPerBookUseCaseImpl extends CountHighlightPerBookUseCase {
  final HighlightRepository _highlightRepository;

  CountHighlightPerBookUseCaseImpl(this._highlightRepository);

  @override
  Future<Map<int, int>> invoke() {
    return _highlightRepository.countHighlightPerBook();
  }
}