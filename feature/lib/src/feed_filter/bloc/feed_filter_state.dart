import 'package:feature/src/feed_filter/bloc/feed_filter_chip.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lib_use_case/lib_use_case.dart';

part 'feed_filter_state.freezed.dart';

@freezed
class FeedFilterState with _$FeedFilterState {
  const factory FeedFilterState(
    HighlightFeedFilter filter, {
    List<FeedFilterChip>? chips,
  }) = _FeedFilterState;
}
