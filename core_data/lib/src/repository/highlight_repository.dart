import 'package:core_data/core_data.dart';
import 'package:core_data/src/repository/access_token_helper.dart';
import 'package:core_data/src/repository/mapper/highlight_mapper.dart';
import 'package:core_database/core_database.dart';
import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';

abstract class HighlightRepository {
  Future<List<HighlightEntity>> getHighlightsFromBook(int bookId);

  Future<Set<int>> fetchRemoteHighlights(String? lastSync);
}

@Injectable(as: HighlightRepository)
class HighlightRepositoryImpl extends HighlightRepository {
  final ReadwiseClient readwiseClient;
  final AccessTokenRepository accessTokenRepository;
  final HighlightDao highlightDao;

  HighlightRepositoryImpl(
    this.readwiseClient,
    this.accessTokenRepository,
    this.highlightDao,
  );

  @override
  Future<List<HighlightEntity>> getHighlightsFromBook(int bookId) async {
    final cachedHighlights =
        await highlightDao.getAllHighlightsFromBook(bookId);

    if (cachedHighlights.isNotEmpty) {
      return cachedHighlights;
    }

    final accessToken = await accessTokenRepository.getAccessToken();
    if (accessToken == null) throw Exception('no accessToken');

    final response =
        await readwiseClient.getHighlights(withPrefix(accessToken));
    if (response.results.isEmpty) {
      return List.empty();
    }

    final entities = response.results.map((e) => e.toEntity()).toList();
    await highlightDao.insertHighlights(entities);
    return entities;
  }

  @override
  Future<Set<int>> fetchRemoteHighlights(String? lastSync) async {
    final accessToken = await accessTokenRepository.getAccessToken();
    if (accessToken == null) throw Exception('no accessToken');

    String? nextUrl;
    var page = 1;
    final bookIds = <int>{};

    do {
      final response = await readwiseClient.getHighlights(
        accessToken,
        page: page,
        updatedGt: lastSync,
      );

      if (response.results.isEmpty) break;

      final entities = response.results.map((e) => e.toEntity()).toList();
      await highlightDao.insertHighlights(entities);

      for (var element in entities) {
        bookIds.add(element.bookId);
      }

      nextUrl = response.next;
      page++;
    } while (nextUrl != null);

    return bookIds;
  }
}
