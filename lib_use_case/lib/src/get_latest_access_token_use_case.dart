import 'package:core_data/core_data.dart';

abstract class GetLatestAccessTokenUseCase {
  Future<String?> getLatestAccessToken();
}

class GetLatestAccessTokenUseCaseImpl extends GetLatestAccessTokenUseCase {
  final AccessTokenRepository accessTokenRepo;

  GetLatestAccessTokenUseCaseImpl(this.accessTokenRepo);
  
  @override
  Future<String?> getLatestAccessToken() {
    return accessTokenRepo.getAccessToken();
  }
}