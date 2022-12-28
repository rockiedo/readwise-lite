import 'package:injectable/injectable.dart';
import 'package:lib_use_case/src/use_case/load_highlight_feeds/highlight_feed.dart';
import 'package:lib_use_case/src/use_case/load_highlight_feeds/highlight_feed_filter.dart';

abstract class LoadHighlightFeedsUseCase {
  Future<List<HighlightFeed>> invoke(HighlightFeedFilter filter);
}

@Injectable(as: LoadHighlightFeedsUseCase)
class LoadHighlightFeedsUseCaseImpl extends LoadHighlightFeedsUseCase {
  @override
  Future<List<HighlightFeed>> invoke(HighlightFeedFilter filter) {
    // TODO: implement invoke
    throw UnimplementedError();
  }
}