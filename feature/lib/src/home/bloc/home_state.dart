import 'package:core_model/core_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

enum HomeStatus { loading, noAccessToken, content }

@freezed
class HomeState with _$HomeState {
  const factory HomeState(HomeStatus status) = _FeedState;
}
