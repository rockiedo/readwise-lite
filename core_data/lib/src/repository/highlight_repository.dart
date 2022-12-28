import 'package:core_data/core_data.dart';
import 'package:core_data/src/repository/access_token_helper.dart';
import 'package:core_data/src/repository/mapper/highlight_mapper.dart';
import 'package:core_database/core_database.dart';
import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';

abstract class HighlightRepository {
  Future fetchHighlightsFromBook(
    int bookId,
    String? lastSync,
  );
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
  Future fetchHighlightsFromBook(
    int bookId,
    String? lastSync,
  ) async {
    final accessToken = await accessTokenRepository.loadAccessToken();
    assert(accessToken != null);

    String? nextUrl;
    var page = 1;

    do {
      final response = await readwiseClient.getHighlights(
        withPrefix(accessToken!),
        bookId: bookId,
        page: page,
        updatedGt: lastSync,
      );

      if (response.results.isEmpty) break;

      final entities = response.results.map((e) => e.toEntity()).toList();
      await highlightDao.insertHighlights(entities);

      nextUrl = response.next;
      page++;
    } while (nextUrl != null);
  }
}
