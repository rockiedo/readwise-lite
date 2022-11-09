import 'package:core_data/core_data.dart';
import 'package:core_data/src/mapper/highlight_mapper.dart';
import 'package:core_database/core_database.dart';
import 'package:core_model/core_model.dart';
import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';

abstract class HighlightRepository {
  Future<List<Highlight>> getHighlightsFromBook(int bookId);
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
  Future<List<Highlight>> getHighlightsFromBook(int bookId) async {
    final cachedHighlights =
        await highlightDao.getAllHighlightsFromBook(bookId);

    if (cachedHighlights.isNotEmpty) {
      return cachedHighlights.map((e) => e.toExternalModel()).toList();
    }

    final accessToken = await accessTokenRepository.getAccessToken();
    if (accessToken == null) throw Exception('no accessToken');

    final response = await readwiseClient.getHighlights(accessToken);
    if (response.results.isEmpty) {
      return List.empty();
    }

    final entities = response.results.map((e) => e.toEntity()).toList();
    await highlightDao.insertHighlights(entities);
    return entities.map((e) => e.toExternalModel()).toList();
  }
}
