import 'package:core_database/src/model/access_token_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

abstract class AccessTokenDao {
  Future<void> insertToken(AccessTokenEntity token);
  Future<AccessTokenEntity> getCurrentlyActiveToken();
}

@Injectable(as: AccessTokenDao)
class AccessTokenDaoImpl extends AccessTokenDao {
  final Database database;

  AccessTokenDaoImpl(this.database);

  @override
  Future<AccessTokenEntity> getCurrentlyActiveToken() {
    throw UnimplementedError();
  }

  @override
  Future<void> insertToken(AccessTokenEntity token) {
    throw UnimplementedError();
  }
}