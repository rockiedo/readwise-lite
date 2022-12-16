import 'package:injectable/injectable.dart';
import 'package:sqflite/sqlite_api.dart';

import '../database_constant.dart';
import '../model/highlight_entity.dart';

abstract class HighlightDao {
  Future<void> insertHighlights(List<HighlightEntity> highlights);

  Future<List<HighlightEntity>> getAllHighlightsFromBook(int bookId);
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
}
