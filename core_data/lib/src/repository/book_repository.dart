import 'package:core_data/core_data.dart';
import 'package:core_data/src/repository/access_token_helper.dart';
import 'package:core_data/src/repository/mapper/book_mapper.dart';
import 'package:core_database/core_database.dart';
import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';

abstract class BookRepository {
  Future fetchBooks(String? lastSync);

  Future<List<BookEntity>> loadBooks();
}

@LazySingleton(as: BookRepository)
class BookRepositoryImpl extends BookRepository {
  final AccessTokenRepository accessTokenRepository;
  final ReadwiseClient readwiseClient;
  final BookDao bookDao;

  BookRepositoryImpl(
    this.accessTokenRepository,
    this.readwiseClient,
    this.bookDao,
  );

  @override
  Future fetchBooks(String? lastSync) async {
    final accessToken = await accessTokenRepository.loadAccessToken();
    assert(accessToken != null);

    final response = await readwiseClient.getBooks(
      withPrefix(accessToken!),
      updatedGt: lastSync,
    );
    final entities = response.results
        .where((element) => element.author?.isNotEmpty ?? false)
        .map((networkBook) => networkBook.toEntity(accessToken))
        .toList();

    await bookDao.insertBooks(entities);
  }

  @override
  Future<List<BookEntity>> loadBooks() async {
    final accessToken = await accessTokenRepository.loadAccessToken();
    assert(accessToken != null);

    return bookDao.getBooks(accessToken!);
  }
}
