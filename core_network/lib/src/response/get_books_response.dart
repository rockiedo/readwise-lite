import 'package:core_network/src/model/network_book.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_books_response.g.dart';

@JsonSerializable()
class GetBooksResponse {
  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'next')
  final String? next;
  @JsonKey(name: 'previous')
  final String? previous;
  @JsonKey(name: 'results')
  final List<NetworkBook> results;

  GetBooksResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory GetBooksResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBooksResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetBooksResponseToJson(this);
}
