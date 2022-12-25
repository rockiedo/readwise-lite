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
  Future<String?> getLastSync(int bookId) {
    // TODO: implement getLastSync
    throw UnimplementedError();
  }

  @override
  Future setLastSync(int bookId, String timestamp) {
    // TODO: implement setLastSync
    throw UnimplementedError();
  }
}