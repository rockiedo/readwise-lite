import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class KeyValueStore {
  Future<void> write(String key, String value);

  Future<String?> read(String key);
}

class KeyValueStoreImpl extends KeyValueStore {
  final FlutterSecureStorage secureStorage;

  KeyValueStoreImpl(this.secureStorage);
  
  @override
  Future<String?> read(String key) {
    return secureStorage.read(key: key);
  }
  
  @override
  Future<void> write(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }
}