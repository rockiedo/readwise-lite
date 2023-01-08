import 'package:core_database/core_database.dart';
import 'package:injectable/injectable.dart';

abstract class AccessTokenRepository {
  Future<String?> loadAccessToken();
  Future<void> storeAccessToken(String token, String alias);
  Future resetAccessToken(String token);
}

@LazySingleton(as: AccessTokenRepository)
class AccessTokenRepositoryImpl extends AccessTokenRepository {
  final AccessTokenDao accessTokenDao;

  AccessTokenRepositoryImpl(this.accessTokenDao);

  @override
  Future<String?> loadAccessToken() {
    return accessTokenDao
        .getCurrentlyActiveToken()
        .then((entity) => entity.token, onError: (_) => null);
  }

  @override
  Future<void> storeAccessToken(String token, String alias) {
    final entity = AccessTokenEntity(
      token: token,
      alias: alias,
      isActive: 1,
    );
    return accessTokenDao.insertToken(entity);
  }

  @override
  Future resetAccessToken(String token) {
    return accessTokenDao.resetToken(token);
  }
}
