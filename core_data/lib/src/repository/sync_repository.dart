import 'package:core_datastore/core_datastore.dart';
import 'package:injectable/injectable.dart';

abstract class SyncRepository {
  Future<String?> loadLastSync();
}

const _keyLastSync = 'last_sync';

@Injectable(as: SyncRepository)
class SyncRepositoryImpl extends SyncRepository {
  final KeyValueStore keyValueStore;

  SyncRepositoryImpl(this.keyValueStore);

  @override
  Future<String?> loadLastSync() {
    return keyValueStore.read(_keyLastSync);
  }
}