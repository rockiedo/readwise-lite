import 'package:core_data/core_data.dart';
import 'package:injectable/injectable.dart';
import 'package:lib_use_case/src/use_case/load_highlight_feeds/highlight_feed.dart';
import 'package:lib_use_case/src/use_case/load_highlight_feeds/highlight_feed_filter.dart';

@Injectable()
class LoadHighlightFeedsUseCase {
  final HighlightRepository _highlightRepository;

  LoadHighlightFeedsUseCase(this._highlightRepository);

  Future<List<HighlightFeed>> invoke(int pageKey, int pageSize,
      {HighlightFeedFilter? filter}) async {
    final entities = await _highlightRepository.searchHighlights(
      pageKey,
      pageSize,
      bookId: filter?.bookIds,
      author: filter?.authors,
      searchTerm: filter?.searchTerm,
    );

    entities.sort(
          (a, b) {
        final asc =
        DateTime.parse(a.updated).compareTo(DateTime.parse(b.updated));
        return -asc;
      },
    );

    return entities
        .map(
          (e) => HighlightFeed(
        id: e.id,
        bookId: e.bookId,
        author: e.author,
        text: e.text,
      ),
    )
        .toList();
  }
}
