library core_data;

import 'package:core_data/src/repository/access_token_repository.dart';
import 'package:core_data/src/repository/book_repository.dart';
import 'package:core_datastore/core_datastore.dart';
import 'package:core_network/core_network.dart';
import 'package:get_it/get_it.dart';

export 'src/repository/book_repository.dart';
export 'src/repository/access_token_repository.dart';

final sl = GetIt.I;

void setupCoreDataDi() {
  setupCoreNetworkDi();
  setupCoreDatastoreDi();

  final accessTokenRepo = AccessTokenRepositoryImpl(sl.get<KeyValueStore>());
  sl.registerSingleton<AccessTokenRepository>(accessTokenRepo);

  sl.registerLazySingleton<BookRepository>(() {
    return BookRepositoryImpl(sl.get<ReadwiseClient>(), accessTokenRepo);
  });
}