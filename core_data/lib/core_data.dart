library core_data;

import 'package:core_data/src/di/di.dart';
import 'package:core_database/core_database.dart';
import 'package:core_datastore/core_datastore.dart';
import 'package:core_network/core_network.dart';
import 'package:get_it/get_it.dart';

export 'src/repository/access_token_repository.dart';
export 'src/repository/book_repository.dart';
export 'src/repository/highlight_repository.dart';
export 'src/repository/sync_log_repository.dart';

Future<void> setupCoreDataDi(GetIt getIt) async {
  setupCoreNetworkDi(getIt);
  setupCoreDatastoreDi(getIt);
  await setupDatabase(getIt);

  configureDependencies(getIt);
}
