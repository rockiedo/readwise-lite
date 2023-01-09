import 'package:freezed_annotation/freezed_annotation.dart';

part 'highlight_feed_filter.freezed.dart';

@freezed
class HighlightFeedFilter with _$HighlightFeedFilter {
  const factory HighlightFeedFilter({
    List<int>? bookIds,
    List<String>? authors,
    String? searchTerm,
  }) = _HighlightFeedFilter;
}
