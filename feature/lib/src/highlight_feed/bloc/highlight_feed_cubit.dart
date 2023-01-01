import 'package:feature/src/highlight_feed/bloc/highlight_feed_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class HighlightFeedCubit extends Cubit<HighlightFeedState> {
  final LoadHighlightFeedsUseCase _loadHighlightFeedsUseCase;

  HighlightFeedCubit(this._loadHighlightFeedsUseCase)
      : super(const HighlightFeedState());

  Future<List<HighlightFeed>> loadFeeds(
    int pageSize, {
    HighlightFeedFilter? filter,
    int pageKey = 0,
  }) {
    return _loadHighlightFeedsUseCase.invoke(pageKey, pageSize, filter: filter);
  }
}
