import 'package:core_network/src/response/get_books_response.dart';
import 'package:core_network/src/response/get_highlights_response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'readwise_client.g.dart';

@RestApi()
abstract class ReadwiseClient {
  factory ReadwiseClient(Dio dio, {String baseUrl}) = _ReadwiseClient;

  @GET('/books')
  Future<GetBooksResponse> getBooks(
    @Header('Authorization') String accessToken, {
    @Query('updated__gt') String? updatedGt,
  });

  @GET('/highlights')
  Future<GetHighlightsResponse> getHighlights(
    @Header('Authorization') String accessToken, {
    @Query('page_size') int? pageSize = 200,
    @Query('page') int? page,
    @Query('book_id') int? bookId,
    @Query('updated_lt') String? updatedLt,
    @Query('updated_gt') String? updatedGt,
    @Query('highlighted_at_lt') String? highlightedAtLt,
    @Query('highlighted_at_gt') String? highlightedAtGt,
  });
}
