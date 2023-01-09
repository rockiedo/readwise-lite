import 'package:core_datastore/core_datastore.dart';
import 'package:injectable/injectable.dart';

abstract class SyncLogRepository {
  Future<String?> loadLastAllBooksSync();

  Future storeLastAllBooksSync(String timestamp);
}

const _keyLastSync = 'key.last_sync';

@Injectable(as: SyncLogRepository)
class SyncLogRepositoryImpl extends SyncLogRepository {
  final KeyValueStore _keyValueStore;

  SyncLogRepositoryImpl(this._keyValueStore);

  @override
  Future<String?> loadLastAllBooksSync() {
    return _keyValueStore.read(_keyLastSync);
  }

  @override
  Future storeLastAllBooksSync(String timestamp) {
    return _keyValueStore.write(_keyLastSync, timestamp);
  }
}
