import 'package:core_data/core_data.dart';

abstract class SaveAccessTokenUseCase {
  Future<void> save(String accessToken);
}

class SaveAccessTokenUseCaseImpl extends SaveAccessTokenUseCase {
  final AccessTokenRepository accessTokenRepo;
  
  SaveAccessTokenUseCaseImpl(this.accessTokenRepo);

  @override
  Future<void> save(String accessToken) {
    return accessTokenRepo.saveAccessToken(accessToken);
  }
}