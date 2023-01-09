// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data/core_data.dart' as _i6;
import 'package:core_data/src/repository/access_token_repository.dart' as _i3;
import 'package:core_data/src/repository/book_repository.dart' as _i5;
import 'package:core_data/src/repository/highlight_repository.dart' as _i8;
import 'package:core_data/src/repository/sync_log_repository.dart' as _i9;
import 'package:core_database/core_database.dart' as _i4;
import 'package:core_datastore/core_datastore.dart' as _i10;
import 'package:core_network/core_network.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AccessTokenRepository>(
        () => _i3.AccessTokenRepositoryImpl(gh<_i4.AccessTokenDao>()));
    gh.lazySingleton<_i5.BookRepository>(() => _i5.BookRepositoryImpl(
          gh<_i6.AccessTokenRepository>(),
          gh<_i7.ReadwiseClient>(),
          gh<_i4.BookDao>(),
        ));
    gh.factory<_i8.HighlightRepository>(() => _i8.HighlightRepositoryImpl(
          gh<_i7.ReadwiseClient>(),
          gh<_i6.AccessTokenRepository>(),
          gh<_i4.HighlightDao>(),
        ));
    gh.factory<_i9.SyncLogRepository>(() => _i9.SyncLogRepositoryImpl(
          gh<_i10.KeyValueStore>(),
          gh<_i4.SyncLogDao>(),
        ));
    return this;
  }
}
