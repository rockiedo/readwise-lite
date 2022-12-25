// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sqflite/sqflite.dart' as _i4;
import 'package:sqflite/sqlite_api.dart' as _i7;

import '../dao/access_token_dao.dart' as _i3;
import '../dao/book_dao.dart' as _i5;
import '../dao/highlight_dao.dart' as _i6;
import '../dao/sync_log_dao.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.AccessTokenDao>(
      () => _i3.AccessTokenDaoImpl(get<_i4.Database>()));
  gh.factory<_i5.BookDao>(() => _i5.BookDaoImpl(get<_i4.Database>()));
  gh.factory<_i6.HighlightDao>(() => _i6.HighlightDaoImpl(get<_i7.Database>()));
  gh.factory<_i8.SyncLogDao>(() => _i8.SyncLogDaoImpl(get<_i4.Database>()));
  return get;
}
