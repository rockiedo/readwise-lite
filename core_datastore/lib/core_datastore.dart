library core_datastore;

import 'package:core_datastore/src/key_value_store.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

export 'src/key_value_store.dart';

Future setupCoreDatastoreDi(GetIt getIt) async {
  final sharedPref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<KeyValueStore>(
    () => KeyValueStoreImpl(sharedPref),
  );
}
