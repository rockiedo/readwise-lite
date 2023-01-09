import 'package:core_data/core_data.dart';
import 'package:core_data/src/repository/access_token_helper.dart';
import 'package:core_data/src/repository/mapper/book_mapper.dart';
import 'package:core_database/core_database.dart';
import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';

abstract class BookRepository {
  Future<List<BookEntity>> fetchBooks(String? lastSync);

  Future<List<BookEntity>> loadBooks();
}

@LazySingleton(as: BookRepository)
class BookRepositoryImpl extends BookRepository {
  final AccessTokenRepository _accessTokenRepository;
  final ReadwiseClient _readwiseClient;
  final BookDao _bookDao;

  BookRepositoryImpl(
    this._accessTokenRepository,
    this._readwiseClient,
    this._bookDao,
  );

  @override
  Future<List<BookEntity>> fetchBooks(String? lastSync) async {
    final accessToken = await _accessTokenRepository.loadAccessToken();
    assert(accessToken != null);

    final response = await _readwiseClient.getBooks(
      withPrefix(accessToken!),
      updatedGt: lastSync,
    );
    final entities = response.results
        .where((element) => element.author?.isNotEmpty ?? false)
        .map((networkBook) => networkBook.toEntity(accessToken))
        .toList();

    await _bookDao.insertBooks(entities);
    return entities;
  }

  @override
  Future<List<BookEntity>> loadBooks() async {
    final accessToken = await _accessTokenRepository.loadAccessToken();
    assert(accessToken != null);

    return _bookDao.getBooks(accessToken!);
  }
}
