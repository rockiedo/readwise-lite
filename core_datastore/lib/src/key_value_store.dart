import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class KeyValueStore {
  Future<void> write(String key, String value);

  Future<String?> read(String key);
}

@Injectable(as: KeyValueStore)
class KeyValueStoreImpl extends KeyValueStore {
  final SharedPreferences _sharedPref;

  KeyValueStoreImpl(this._sharedPref);

  @override
  Future<String?> read(String key) async {
    return _sharedPref.getString(key);
  }

  @override
  Future<void> write(String key, String value) async {
    await _sharedPref.setString(key, value);
  }
}
