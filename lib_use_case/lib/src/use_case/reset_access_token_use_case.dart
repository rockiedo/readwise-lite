import 'package:core_data/core_data.dart';
import 'package:injectable/injectable.dart';

abstract class ResetAccessTokenUseCase {
  Future invoke(String token);
}

@Injectable(as: ResetAccessTokenUseCase)
class ResetAccessTokenUseCaseImpl extends ResetAccessTokenUseCase {
  final AccessTokenRepository _accessTokenRepository;

  ResetAccessTokenUseCaseImpl(this._accessTokenRepository);

  @override
  Future invoke(String token) {
    return _accessTokenRepository.resetAccessToken(token);
  }
}
