import 'package:core_data/core_data.dart';
import 'package:injectable/injectable.dart';
import 'package:lib_use_case/lib_use_case.dart';

abstract class SaveAccessTokenUseCase {
  Future<void> invoke(String accessToken, String alias);
}

@Injectable(as: SaveAccessTokenUseCase)
class SaveAccessTokenUseCaseImpl extends SaveAccessTokenUseCase {
  final AccessTokenRepository accessTokenRepo;
  final FetchRemoteBooksUseCase fetchRemoteBooksUseCase;

  SaveAccessTokenUseCaseImpl(
    this.accessTokenRepo,
    this.fetchRemoteBooksUseCase,
  );

  @override
  Future<void> invoke(String accessToken, String alias) async {
    await accessTokenRepo.saveAccessToken(accessToken, alias);
    await fetchRemoteBooksUseCase.invoke(accessToken);
  }
}
