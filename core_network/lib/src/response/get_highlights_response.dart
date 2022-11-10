import 'package:json_annotation/json_annotation.dart';

import '../model/network_highlight.dart';

part 'get_highlights_response.g.dart';

@JsonSerializable()
class GetHighlightsResponse {
  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'next')
  final String? next;
  @JsonKey(name: 'previous')
  final String? previous;
  @JsonKey(name: 'results')
  final List<NetworkHighlight> results;

  GetHighlightsResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory GetHighlightsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetHighlightsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetHighlightsResponseToJson(this);
}
