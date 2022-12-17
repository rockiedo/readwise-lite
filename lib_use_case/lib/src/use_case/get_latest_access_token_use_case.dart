import 'package:core_data/core_data.dart';
import 'package:injectable/injectable.dart';

abstract class GetLatestAccessTokenUseCase {
  Future<String?> invoke();
}

@Injectable(as: GetLatestAccessTokenUseCase)
class GetLatestAccessTokenUseCaseImpl extends GetLatestAccessTokenUseCase {
  final AccessTokenRepository accessTokenRepo;

  GetLatestAccessTokenUseCaseImpl(this.accessTokenRepo);

  @override
  Future<String?> invoke() {
    return accessTokenRepo.getRawAccessToken();
  }
}
