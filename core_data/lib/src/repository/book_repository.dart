import 'package:core_data/src/repository/access_token_repository.dart';
import 'package:core_model/core_model.dart';
import 'package:core_network/core_network.dart';
import 'package:core_data/src/mapper/book_mapper.dart';

abstract class BookRepository {
  Future<List<Book>> getAllBooksSingle();

  Stream<List<Book>> getAllBooksObservable();
}

class BookRepositoryImpl extends BookRepository {
  final ReadwiseClient readwiseClient;
  final AccessTokenRepository accessTokenRepository;

  BookRepositoryImpl(this.readwiseClient, this.accessTokenRepository);

  @override
  Future<List<Book>> getAllBooksSingle() async {
    final accessToken = await accessTokenRepository.getAccessToken();
    if (accessToken == null) throw Exception('no accessToken');

    final response = await readwiseClient.getBooks(accessToken);
    return response.results
        .map((networkBook) => networkBook.toExternalModel())
        .toList();
  }

  @override
  Stream<List<Book>> getAllBooksObservable() {
    throw UnimplementedError();
  }
}
