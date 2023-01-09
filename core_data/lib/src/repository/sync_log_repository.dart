import 'package:core_database/core_database.dart';
import 'package:core_datastore/core_datastore.dart';
import 'package:injectable/injectable.dart';

// todo check usage
abstract class SyncLogRepository {
  Future<String?> loadLastAllBooksSync();

  Future storeLastAllBooksSync(String timestamp);

  Future<String?> loadLastHighlightsSync(int bookId);

  Future storeLastHighlightsSync(int bookId, String timestamp);
}

const _keyLastSync = 'key.last_sync';

@Injectable(as: SyncLogRepository)
class SyncLogRepositoryImpl extends SyncLogRepository {
  final KeyValueStore _keyValueStore;
  final SyncLogDao _syncLogDao;

  SyncLogRepositoryImpl(this._keyValueStore, this._syncLogDao);

  @override
  Future<String?> loadLastAllBooksSync() {
    return _keyValueStore.read(_keyLastSync);
  }

  @override
  Future storeLastAllBooksSync(String timestamp) {
    return _keyValueStore.write(_keyLastSync, timestamp);
  }

  @override
  Future<String?> loadLastHighlightsSync(int bookId) {
    return _syncLogDao.getLastSync(bookId);
  }

  @override
  Future storeLastHighlightsSync(int bookId, String timestamp) {
    return _syncLogDao.setLastSync(bookId, timestamp);
  }
}
