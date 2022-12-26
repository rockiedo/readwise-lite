import 'package:core_database/core_database.dart';
import 'package:core_database/src/database_constant.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

abstract class SyncLogDao {
  Future<String?> getLastSync(int bookId);

  Future setLastSync(int bookId, String timestamp);
}

@Injectable(as: SyncLogDao)
class SyncLogDaoImpl extends SyncLogDao {
  final Database database;

  SyncLogDaoImpl(this.database);

  @override
  Future<String?> getLastSync(int bookId) async {
    List<Map<String, dynamic>> queryResult = await database.query(
      DatabaseConstant.tableSyncLog,
      where: 'book_id = $bookId',
    );

    final logs = List.generate(
      queryResult.length,
      (index) => SyncLogEntity.fromJson(queryResult[index]),
    );

    if (logs.isEmpty) {
      return null;
    }

    return logs.first.lastSync;
  }

  @override
  Future setLastSync(int bookId, String timestamp) async {
    await database.insert(
      DatabaseConstant.tableSyncLog,
      SyncLogEntity(bookId: bookId, lastSync: timestamp).toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
