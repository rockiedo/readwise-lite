import 'package:core_datastore/core_datastore.dart';
import 'package:injectable/injectable.dart';

abstract class SyncRepository {
  Future<String?> getLastSync();
}

const _keyLastSync = 'last_sync';

@Injectable(as: SyncRepository)
class SyncRepositoryImpl extends SyncRepository {
  final KeyValueStore keyValueStore;

  SyncRepositoryImpl(this.keyValueStore);

  @override
  Future<String?> getLastSync() {
    return keyValueStore.read(_keyLastSync);
  }
}