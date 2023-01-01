import 'package:injectable/injectable.dart';
import 'package:sqflite/sqlite_api.dart';

import '../database_constant.dart';
import '../model/highlight_entity.dart';

abstract class HighlightDao {
  Future<void> insertHighlights(List<HighlightEntity> highlights);

  Future<List<HighlightEntity>> getAllHighlightsFromBook(int bookId);

  Future<List<HighlightEntity>> searchHighlights(
    int offset,
    int limit, {
    List<int>? bookIds,
    List<String>? authors,
    String? searchTerm,
  });
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
          "'${h.text}'",
          "'${h.note}'",
          h.location,
          "'${h.locationType}'",
          "'${h.highlightedAt}'",
          "'${h.url}'",
          "'${h.color}'",
          "'${h.updated}'",
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
  Future<List<HighlightEntity>> searchHighlights(int offset, int limit,
      {List<int>? bookIds, List<String>? authors, String? searchTerm}) async {
    var where = '';

    if (bookIds?.isNotEmpty == true) {
      final concatBookIds = bookIds!.fold(
        '',
        (previousValue, element) => '$previousValue, $element',
      );
      where = 'book_id in ($concatBookIds)';
    }

    // if (authors?.isNotEmpty == true) {
    //   final concatAuthors = authors!.fold(
    //     '',
    //     (previousValue, element) => '$previousValue, $element',
    //   );
    //   where = where.isEmpty ? '$where AND $concatAuthors';
    // }

    if (searchTerm?.isNotEmpty == true) {
      final filter = "text LIKE '%$searchTerm%'";
      where = where.isEmpty ? filter : '$where AND $filter';
    }

    List<Map<String, dynamic>> queryResult = await database.query(
      DatabaseConstant.tableHighlightName,
      where: where.isEmpty ? null : where,
      offset: offset,
      limit: limit,
    );
    return List.generate(
      queryResult.length,
      (index) => HighlightEntity.fromJson(queryResult[index]),
    );
  }
}
