import 'package:core_data/src/repository/access_token_repository.dart';
import 'package:core_data/src/repository/mapper/book_mapper.dart';
import 'package:core_database/core_database.dart';
import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';

abstract class BookRepository {
  Future fetchRemoteBooks();
  Future<List<BookEntity>> getLocalBooks();
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
  Future fetchRemoteBooks() async {
    final accessToken = await accessTokenRepository.getAccessToken();
    if (accessToken == null) throw Exception('no accessToken');

    final response = await readwiseClient.getBooks(accessToken);
    final entities = response.results
        .where((element) => element.author?.isNotEmpty ?? false)
        .map((networkBook) => networkBook.toEntity(accessToken))
        .toList();

    await bookDao.insertBooks(entities);
  }
  
  @override
  Future<List<BookEntity>> getLocalBooks() async {
    final accessToken = await accessTokenRepository.getAccessToken();
    if (accessToken == null) throw Exception('no accessToken');
    
    return bookDao.getBooks(accessToken);
  }
}
