import 'package:core_data/core_data.dart';
import 'package:injectable/injectable.dart';

abstract class SaveAccessTokenUseCase {
  Future<void> invoke(String accessToken);
}

@Injectable(as: SaveAccessTokenUseCase)
class SaveAccessTokenUseCaseImpl extends SaveAccessTokenUseCase {
  final AccessTokenRepository _accessTokenRepo;

  SaveAccessTokenUseCaseImpl(this._accessTokenRepo);

  @override
  Future<void> invoke(String accessToken) async {
    await _accessTokenRepo.storeAccessToken(accessToken);
  }
}
