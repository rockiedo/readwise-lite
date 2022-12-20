import 'package:core_database/core_database.dart';
import 'package:injectable/injectable.dart';

abstract class AccessTokenRepository {
  Future<String?> getRawAccessToken();

  Future<String?> getAccessToken();

  Future<void> saveAccessToken(String token, String alias);
}

@LazySingleton(as: AccessTokenRepository)
class AccessTokenRepositoryImpl extends AccessTokenRepository {
  final AccessTokenDao accessTokenDao;

  AccessTokenRepositoryImpl(this.accessTokenDao);

  @override
  Future<String?> getRawAccessToken() {
    return accessTokenDao
        .getCurrentlyActiveToken()
        .then((entity) => entity.token, onError: (_) => null);
  }

  @override
  Future<String?> getAccessToken() {
    return accessTokenDao
        .getCurrentlyActiveToken()
        .then((entity) => 'Token ${entity.token}');
  }

  @override
  Future<void> saveAccessToken(String token, String alias) {
    final entity = AccessTokenEntity(
      token: token,
      alias: alias,
      isActive: 1,
    );
    return accessTokenDao.insertToken(entity);
  }
}
