import 'package:core_data/core_data.dart';
import 'package:injectable/injectable.dart';

abstract class SaveAccessTokenUseCase {
  Future<void> invoke(String accessToken, String alias);
}

@Injectable(as: SaveAccessTokenUseCase)
class SaveAccessTokenUseCaseImpl extends SaveAccessTokenUseCase {
  final AccessTokenRepository accessTokenRepo;

  SaveAccessTokenUseCaseImpl(this.accessTokenRepo);

  @override
  Future<void> invoke(String accessToken, String alias) async {
    await accessTokenRepo.saveAccessToken(accessToken, alias);
  }
}
