// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data/core_data.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../use_case/get_all_books_use_case.dart' as _i3;
import '../use_case/get_latest_access_token_use_case.dart' as _i5;
import '../use_case/save_access_token_use_case.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.GetAllBooksUseCase>(
      () => _i3.GetAllBooksUseCaseImpl(get<_i4.BookRepository>()));
  gh.factory<_i5.GetLatestAccessTokenUseCase>(() =>
      _i5.GetLatestAccessTokenUseCaseImpl(get<_i4.AccessTokenRepository>()));
  gh.factory<_i6.SaveAccessTokenUseCase>(
      () => _i6.SaveAccessTokenUseCaseImpl(get<_i4.AccessTokenRepository>()));
  return get;
}
