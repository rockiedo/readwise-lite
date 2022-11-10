library core_datastore;

import 'package:core_datastore/src/key_value_store.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

export 'src/key_value_store.dart';

void setupCoreDatastoreDi(GetIt getIt) {
  getIt.registerLazySingleton<KeyValueStore>(
      () => KeyValueStoreImpl(const FlutterSecureStorage()));
}
