library lib_use_case;

import 'package:core_data/core_data.dart';
import 'package:get_it/get_it.dart';
import 'package:lib_use_case/src/get_all_books_use_case.dart';
import 'package:lib_use_case/src/get_latest_access_token_use_case.dart';
import 'package:lib_use_case/src/save_access_token_use_case.dart';
import 'dart:developer' as dev;

export 'src/get_all_books_use_case.dart';
export 'src/save_access_token_use_case.dart';
export 'src/get_latest_access_token_use_case.dart';

final libUseCaseSl = GetIt.I;

void setupLibUseCaseDi() {
  libUseCaseSl
    ..registerFactory<GetAllBooksUseCase>(
      () => GetAllBooksUseCaseImpl(libUseCaseSl.get<BookRepository>()),
    )
    ..registerFactory<SaveAccessTokenUseCase>(
      () => SaveAccessTokenUseCaseImpl(
        libUseCaseSl.get<AccessTokenRepository>(),
      ),
    )
    ..registerFactory<GetLatestAccessTokenUseCase>(() {
      dev.log('create');

      return GetLatestAccessTokenUseCaseImpl(
        libUseCaseSl.get<AccessTokenRepository>(),
      );
    });
}
