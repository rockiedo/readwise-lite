import 'package:core_database/src/database_constant.dart';
import 'package:core_database/src/model/access_token_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

abstract class AccessTokenDao {
  Future<void> insertToken(AccessTokenEntity token);

  Future<AccessTokenEntity> getCurrentlyActiveToken();

  Future resetToken(String token);
}

@Injectable(as: AccessTokenDao)
class AccessTokenDaoImpl extends AccessTokenDao {
  final Database _database;

  AccessTokenDaoImpl(this._database);

  @override
  Future<void> insertToken(AccessTokenEntity token) async {
    await _database.insert(
      DatabaseConstant.tableAccessTokenName,
      token.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<AccessTokenEntity> getCurrentlyActiveToken() async {
    List<Map<String, dynamic>> queryResult = await _database.query(
      DatabaseConstant.tableAccessTokenName,
      where: 'is_active = 1',
      limit: 1,
    );
    return AccessTokenEntity.fromJson(queryResult.first);
  }

  @override
  Future resetToken(String token) async {
    await _database.update(
        DatabaseConstant.tableAccessTokenName, {'is_active': 0},
        where: "token = '$token'");
  }
}
