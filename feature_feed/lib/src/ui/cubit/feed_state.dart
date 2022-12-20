import 'package:core_model/core_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_state.freezed.dart';

enum FeedStatus { loading, unknownError, noAccessToken, outdatedCache, content }

@freezed
class FeedState with _$FeedState {
  const factory FeedState(
    FeedStatus status, {
    List<Book>? books,
        String? lastSync,
  }) = _FeedState;
}
