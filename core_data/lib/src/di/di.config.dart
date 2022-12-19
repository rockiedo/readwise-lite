// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_database/core_database.dart' as _i4;
import 'package:core_datastore/core_datastore.dart' as _i10;
import 'package:core_network/core_network.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core_data.dart' as _i8;
import '../repository/access_token_repository.dart' as _i3;
import '../repository/book_repository.dart' as _i5;
import '../repository/highlight_repository.dart' as _i7;
import '../repository/sync_repository.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AccessTokenRepository>(
      () => _i3.AccessTokenRepositoryImpl(get<_i4.AccessTokenDao>()));
  gh.lazySingleton<_i5.BookRepository>(() => _i5.BookRepositoryImpl(
        get<_i6.ReadwiseClient>(),
        get<_i4.BookDao>(),
      ));
  gh.factory<_i7.HighlightRepository>(() => _i7.HighlightRepositoryImpl(
        get<_i6.ReadwiseClient>(),
        get<_i8.AccessTokenRepository>(),
        get<_i4.HighlightDao>(),
      ));
  gh.factory<_i9.SyncRepository>(
      () => _i9.SyncRepositoryImpl(get<_i10.KeyValueStore>()));
  return get;
}
