import 'package:core_data/src/repository/access_token_repository.dart';
import 'package:core_database/core_database.dart';
import 'package:core_model/core_model.dart';
import 'package:core_network/core_network.dart';
import 'package:core_data/src/mapper/book_mapper.dart';
import 'package:injectable/injectable.dart';

abstract class BookRepository {
  Future<List<Book>> getAllBooksSingle();

  Stream<List<Book>> getAllBooksObservable();
}

@LazySingleton(as: BookRepository)
class BookRepositoryImpl extends BookRepository {
  final ReadwiseClient readwiseClient;
  final AccessTokenRepository accessTokenRepository;
  final BookDao bookDao;

  BookRepositoryImpl(
    this.readwiseClient,
    this.accessTokenRepository,
    this.bookDao,
  );

  @override
  Future<List<Book>> getAllBooksSingle() async {
    final accessToken = await accessTokenRepository.getAccessToken();
    if (accessToken == null) throw Exception('no accessToken');

    final localBooks = await bookDao.getBooks(accessToken);
    if (localBooks.isNotEmpty) {
      return localBooks.map((e) => e.toExternalModel()).toList();
    }

    final response = await readwiseClient.getBooks(accessToken);
    final entities = response.results
        .where((element) => element.author?.isNotEmpty ?? false)
        .map((networkBook) => networkBook.toEntity(accessToken))
        .toList();

    await bookDao.insertBooks(entities);

    return entities
        .map((entity) => entity.toExternalModel())
        .toList();
  }

  @override
  Stream<List<Book>> getAllBooksObservable() {
    throw UnimplementedError();
  }
}
