import 'package:core_database/core_database.dart';
import 'package:core_datastore/core_datastore.dart';
import 'package:injectable/injectable.dart';

abstract class SyncLogRepository {
  Future<String?> loadLastAllBooksSync();
  Future storeLastAllBooksSync(String timestamp);
  Future<String?> loadLastHighlightsSync(int bookId);
  Future storeLastHighlightsSync(int bookId, String timestamp);
}

const _keyLastSync = 'key.last_sync';

@Injectable(as: SyncLogRepository)
class SyncLogRepositoryImpl extends SyncLogRepository {
  final KeyValueStore keyValueStore;
  final SyncLogDao syncLogDao;

  SyncLogRepositoryImpl(this.keyValueStore, this.syncLogDao);

  @override
  Future<String?> loadLastAllBooksSync() {
    return keyValueStore.read(_keyLastSync);
  }

  @override
  Future storeLastAllBooksSync(String timestamp) {
    return keyValueStore.write(_keyLastSync, timestamp);
  }

  @override
  Future<String?> loadLastHighlightsSync(int bookId) {
    return syncLogDao.getLastSync(bookId);
  }

  @override
  Future storeLastHighlightsSync(int bookId, String timestamp) {
    return syncLogDao.setLastSync(bookId, timestamp);
  }
}