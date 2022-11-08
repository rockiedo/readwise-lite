import 'package:injectable/injectable.dart';
import 'package:sqflite/sqlite_api.dart';

import '../database_constant.dart';
import '../model/highlight_entity.dart';

abstract class HighlightDao {
  Future<void> insertHighlights(List<HighlightEntity> highlights);
}

@Injectable(as: HighlightDao)
class HighlightDaoImpl extends HighlightDao {
  final Database database;

  HighlightDaoImpl(this.database);

  @override
  Future<void> insertHighlights(List<HighlightEntity> highlights) async {
    final batch = database.batch();

    for (final highlight in highlights) {
      batch.insert(DatabaseConstant.tableHighlightName, highlight.toJson());
    }

    await batch.commit();
  }
}