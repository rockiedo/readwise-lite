import 'package:core_network/src/response/get_books_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'readwise_client.g.dart';

@RestApi()
abstract class ReadwiseClient {
  factory ReadwiseClient(Dio dio, {String baseUrl}) = _ReadwiseClient;

  @GET('/books')
  Future<GetBooksResponse> getBooks(
      @Header('Authorization') String accessToken);
}
