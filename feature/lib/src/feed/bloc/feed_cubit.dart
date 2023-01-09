import 'package:feature/src/feed/bloc/feed_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class FeedCubit extends Cubit<FeedState> {
  final LoadHighlightFeedsUseCase _loadHighlightFeedsUseCase;

  FeedCubit(this._loadHighlightFeedsUseCase) : super(const FeedState());

  Future<List<HighlightFeed>> loadFeeds(
    int pageSize, {
    HighlightFeedFilter? filter,
    int pageKey = 0,
  }) {
    return _loadHighlightFeedsUseCase.invoke(pageKey, pageSize, filter: filter);
  }
}
