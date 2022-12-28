import 'package:feature/src/highlight_feed/bloc/highlight_feed_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class HighlightFeedCubit extends Cubit<HighlightFeedState> {
  HighlightFeedCubit() : super(const HighlightFeedState());

  Future<List<HighlightFeed>> loadFeeds(
    int pageSize, {
    HighlightFeedFilter? filter,
    int pageKey = 0,
  }) async {
    if (pageKey > 100) return List.empty();

    return List.generate(
      pageSize,
      (index) => HighlightFeed(
        id: pageKey + index,
        bookId: pageKey + index,
        author: 'The Awesome Author',
        text:
            'This is the mockup highlight to test run the paginated list. The index of this item is ${pageKey + index}',
      ),
    );
  }
}
