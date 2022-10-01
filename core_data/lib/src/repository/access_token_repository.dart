import 'package:core_datastore/core_datastore.dart';
import 'package:injectable/injectable.dart';

abstract class AccessTokenRepository {
  Future<String?> getAccessToken();

  Future<void> saveAccessToken(String token);
}

@LazySingleton(as: AccessTokenRepository)
class AccessTokenRepositoryImpl extends AccessTokenRepository {
  final KeyValueStore keyValueStore;

  AccessTokenRepositoryImpl(this.keyValueStore);
  
  @override
  Future<String?> getAccessToken() {
    return keyValueStore.read(_keyAccessToken);
  }

  static const _keyAccessToken = 'key_access_token';
  
  @override
  Future<void> saveAccessToken(String token) {
    return keyValueStore.write(_keyAccessToken, token);
  }
}