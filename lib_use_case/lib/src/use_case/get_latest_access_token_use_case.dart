import 'package:core_data/core_data.dart';
import 'package:injectable/injectable.dart';

abstract class GetAccessTokenUseCase {
  Future<String?> invoke();
}

@Injectable(as: GetAccessTokenUseCase)
class GetLatestAccessTokenUseCaseImpl extends GetAccessTokenUseCase {
  final AccessTokenRepository accessTokenRepo;

  GetLatestAccessTokenUseCaseImpl(this.accessTokenRepo);

  @override
  Future<String?> invoke() {
    return accessTokenRepo.loadAccessToken();
  }
}
