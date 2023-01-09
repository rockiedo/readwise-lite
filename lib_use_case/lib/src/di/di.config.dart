// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data/core_data.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:lib_use_case/src/use_case/count_highlight_per_book_use_case.dart'
    as _i3;
import 'package:lib_use_case/src/use_case/fetch_books_use_case.dart' as _i5;
import 'package:lib_use_case/src/use_case/fetch_highlights_from_book_use_case.dart'
    as _i6;
import 'package:lib_use_case/src/use_case/get_latest_access_token_use_case.dart'
    as _i7;
import 'package:lib_use_case/src/use_case/get_local_books_use_case.dart' as _i8;
import 'package:lib_use_case/src/use_case/load_highlight_feeds/load_highlight_feeds_use_case.dart'
    as _i9;
import 'package:lib_use_case/src/use_case/reset_access_token_use_case.dart'
    as _i10;
import 'package:lib_use_case/src/use_case/save_access_token_use_case.dart'
    as _i11;

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
    gh.factory<_i3.CountHighlightPerBookUseCase>(() =>
        _i3.CountHighlightPerBookUseCaseImpl(gh<_i4.HighlightRepository>()));
    gh.factory<_i5.FetchBooksUseCase>(() => _i5.FetchBooksUseCaseImpl(
          gh<_i4.BookRepository>(),
          gh<_i4.SyncLogRepository>(),
        ));
    gh.factory<_i6.FetchHighlightsFromBookUseCase>(
        () => _i6.FetchHighlightsFromBookUseCaseImpl(
              gh<_i4.HighlightRepository>(),
              gh<_i4.SyncLogRepository>(),
            ));
    gh.factory<_i7.GetAccessTokenUseCase>(() =>
        _i7.GetLatestAccessTokenUseCaseImpl(gh<_i4.AccessTokenRepository>()));
    gh.factory<_i8.GetLocalBooksUseCase>(
        () => _i8.GetLocalBooksUseCaseImpl(gh<_i4.BookRepository>()));
    gh.factory<_i9.LoadHighlightFeedsUseCase>(
        () => _i9.LoadHighlightFeedsUseCaseImpl(gh<_i4.HighlightRepository>()));
    gh.factory<_i10.ResetAccessTokenUseCase>(() =>
        _i10.ResetAccessTokenUseCaseImpl(gh<_i4.AccessTokenRepository>()));
    gh.factory<_i11.SaveAccessTokenUseCase>(
        () => _i11.SaveAccessTokenUseCaseImpl(gh<_i4.AccessTokenRepository>()));
    return this;
  }
}
