import 'package:core_database/core_database.dart';
import 'package:injectable/injectable.dart';

abstract class AccessTokenRepository {
  Future<String?> loadAccessToken();

  Future<void> storeAccessToken(String token);

  Future resetAccessToken(String token);
}

@LazySingleton(as: AccessTokenRepository)
class AccessTokenRepositoryImpl extends AccessTokenRepository {
  final AccessTokenDao _accessTokenDao;

  AccessTokenRepositoryImpl(this._accessTokenDao);

  @override
  Future<String?> loadAccessToken() {
    return _accessTokenDao
        .getCurrentlyActiveToken()
        .then((entity) => entity.token, onError: (_) => null);
  }

  @override
  Future<void> storeAccessToken(String token) {
    final entity = AccessTokenEntity(
      token: token,
      isActive: 1,
    );
    return _accessTokenDao.insertToken(entity);
  }

  @override
  Future resetAccessToken(String token) {
    return _accessTokenDao.resetToken(token);
  }
}
