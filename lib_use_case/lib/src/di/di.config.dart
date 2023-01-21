// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data/core_data.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:lib_use_case/src/use_case/fetch_books_use_case.dart' as _i3;
import 'package:lib_use_case/src/use_case/get_local_books_use_case.dart' as _i5;
import 'package:lib_use_case/src/use_case/load_highlight_feeds/load_highlight_feeds_use_case.dart'
    as _i6;

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
    gh.factory<_i3.FetchBooksUseCase>(() => _i3.FetchBooksUseCase(
          gh<_i4.BookRepository>(),
          gh<_i4.SyncLogRepository>(),
        ));
    gh.factory<_i5.GetLocalBooksUseCase>(
        () => _i5.GetLocalBooksUseCase(gh<_i4.BookRepository>()));
    gh.factory<_i6.LoadHighlightFeedsUseCase>(
        () => _i6.LoadHighlightFeedsUseCase(gh<_i4.HighlightRepository>()));
    return this;
  }
}
