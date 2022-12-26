// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data/core_data.dart' as _i4;
import 'package:core_datastore/core_datastore.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../use_case/fetch_books_use_case.dart' as _i3;
import '../use_case/fetch_highlights_from_book_use_case.dart' as _i6;
import '../use_case/get_latest_access_token_use_case.dart' as _i7;
import '../use_case/get_local_books_use_case.dart' as _i8;
import '../use_case/log_sync_use_case.dart' as _i10;
import '../use_case/save_access_token_use_case.dart'
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
  gh.factory<_i3.FetchBooksUseCase>(() => _i3.FetchBooksUseCaseImpl(
        get<_i4.BookRepository>(),
        get<_i5.KeyValueStore>(),
      ));
  gh.factory<_i6.FetchHighlightsFromBookUseCase>(() =>
      _i6.FetchHighlightsFromBookUseCaseImpl(get<_i4.HighlightRepository>()));
  gh.factory<_i7.GetAccessTokenUseCase>(() =>
      _i7.GetLatestAccessTokenUseCaseImpl(get<_i4.AccessTokenRepository>()));
  gh.factory<_i8.GetLocalBooksUseCase>(
      () => _i8.GetLocalBooksUseCaseImpl(get<_i4.BookRepository>()));
  gh.factory<_i9.SaveAccessTokenUseCase>(
      () => _i9.SaveAccessTokenUseCaseImpl(get<_i4.AccessTokenRepository>()));
  gh.factory<_i10.SyncLoggerUseCase>(
      () => _i10.SyncLoggerUseCaseImpl(get<_i4.SyncRepository>()));
  return get;
}
