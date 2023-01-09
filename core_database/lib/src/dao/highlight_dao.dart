import 'package:core_database/src/dao/query_result/highlight_feed_query_result.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqlite_api.dart';

import '../database_constant.dart';
import '../model/highlight_entity.dart';

abstract class HighlightDao {
  Future<void> insertHighlights(List<HighlightEntity> highlights);

  Future<List<HighlightEntity>> getAllHighlightsFromBook(int bookId);

  Future<List<HighlightFeedQueryResult>> searchHighlights(
    int offset,
    int limit, {
    List<int>? bookIds,
    List<String>? authors,
    String? searchTerm,
  });

  Future<Map<int, int>> countHighlightPerBook();
}

@Injectable(as: HighlightDao)
class HighlightDaoImpl extends HighlightDao {
  final Database database;

  HighlightDaoImpl(this.database);

  @override
  Future<void> insertHighlights(List<HighlightEntity> highlights) async {
    final batch = database.batch();

    for (final h in highlights) {
      batch.rawInsert(
        'INSERT OR REPLACE INTO ${DatabaseConstant.tableHighlightName}(id, text, note, location, location_type, highlighted_at, url, color, updated, book_id) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
          h.id,
          h.text,
          h.note,
          h.location,
          h.locationType,
          h.highlightedAt,
          h.url,
          h.color,
          h.updated,
          h.bookId,
        ],
      );
    }

    await batch.commit();
  }

  @override
  Future<List<HighlightEntity>> getAllHighlightsFromBook(int bookId) async {
    List<Map<String, dynamic>> queryResult = await database.query(
      DatabaseConstant.tableHighlightName,
      where: 'book_id = $bookId',
    );
    return List.generate(
      queryResult.length,
      (index) => HighlightEntity.fromJson(queryResult[index]),
    );
  }

  @override
  Future<List<HighlightFeedQueryResult>> searchHighlights(int offset, int limit,
      {List<int>? bookIds, List<String>? authors, String? searchTerm}) async {
    var where = '';

    if (bookIds?.isNotEmpty == true) {
      final concatBookIds = bookIds!.fold(
        '',
        (previousValue, element) => previousValue.isEmpty
            ? element.toString()
            : '$previousValue, $element',
      );
      where = 'book_id in ($concatBookIds)';
    }

    if (authors?.isNotEmpty == true) {
      final concatAuthors = authors!.fold(
        '',
        (previousValue, element) =>
            previousValue.isEmpty ? "'$element'" : "$previousValue, '$element'",
      );
      final filter = 'author IN ($concatAuthors)';
      where = where.isEmpty ? filter : '$where AND $filter';
    }

    if (searchTerm?.isNotEmpty == true) {
      final filter = "text LIKE '%$searchTerm%'";
      where = where.isEmpty ? filter : '$where AND $filter';
    }

    const selectFrom =
        "SELECT h.id as id, h.book_id as book_id, h.text as text, h.updated as updated, b.author as author FROM ${DatabaseConstant.tableHighlightName} AS h LEFT JOIN ${DatabaseConstant.tableBookName} as b ON h.book_id=b.id";
    final interimQuery =
        where.isEmpty ? selectFrom : '$selectFrom WHERE $where';
    final finalQuery = '$interimQuery LIMIT $limit OFFSET $offset';

    List<Map<String, dynamic>> queryResult =
        await database.rawQuery(finalQuery);

    return List.generate(
      queryResult.length,
      (index) => HighlightFeedQueryResult.fromJson(queryResult[index]),
    );
  }

  @override
  Future<Map<int, int>> countHighlightPerBook() async {
    const query =
        "SELECT book_id, COUNT(*) AS num_highlights FROM ${DatabaseConstant.tableHighlightName} GROUP BY book_id";
    final List<Map<String, dynamic>> queryResult =
        await database.rawQuery(query);

    return Map.fromEntries(
      queryResult.map(
        (e) => MapEntry(e['book_id'] as int, e['num_highlights'] as int),
      ),
    );
  }
}
