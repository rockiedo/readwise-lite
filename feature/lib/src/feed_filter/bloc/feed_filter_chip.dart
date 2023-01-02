import 'package:feature/src/feed_filter/bloc/feed_filter_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_filter_chip.freezed.dart';

@freezed
class FeedFilterChip with _$FeedFilterChip {
  const factory FeedFilterChip(
    FeedFilterType type,
    String content, {
    int? id,
  }) = _FeedFilterChip;
}
