import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class KeyValueStore {
  Future<void> write(String key, String value);

  Future<String?> read(String key);
}

@Injectable(as: KeyValueStore)
class KeyValueStoreImpl extends KeyValueStore {
  final FlutterSecureStorage _secureStorage;

  KeyValueStoreImpl(this._secureStorage);
  
  @override
  Future<String?> read(String key) {
    return _secureStorage.read(key: key);
  }
  
  @override
  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }
}