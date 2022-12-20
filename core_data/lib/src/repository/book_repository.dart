import 'package:core_data/src/repository/mapper/book_mapper.dart';
import 'package:core_database/core_database.dart';
import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';

abstract class BookRepository {
  Future fetchRemoteBooks(String accessToken, {String? lastSync});

  Future<List<BookEntity>> getLocalBooks(String accessToken);
}

@LazySingleton(as: BookRepository)
class BookRepositoryImpl extends BookRepository {
  final ReadwiseClient readwiseClient;
  final BookDao bookDao;

  BookRepositoryImpl(
    this.readwiseClient,
    this.bookDao,
  );

  @override
  Future fetchRemoteBooks(String accessToken, {String? lastSync}) async {
    final response = await readwiseClient.getBooks(
      accessToken,
      updatedGt: lastSync,
    );
    final entities = response.results
        .where((element) => element.author?.isNotEmpty ?? false)
        .map((networkBook) => networkBook.toEntity(accessToken))
        .toList();

    await bookDao.insertBooks(entities);
  }

  @override
  Future<List<BookEntity>> getLocalBooks(String accessToken) async {
    return bookDao.getBooks(accessToken);
  }
}
