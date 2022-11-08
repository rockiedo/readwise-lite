import 'package:core_database/src/database_constant.dart';
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
  Future<void> insertToken(AccessTokenEntity token) async {
    await database.insert(
      DatabaseConstant.tableAccessTokenName,
      token.toJson(),
    );
  }

  @override
  Future<AccessTokenEntity> getCurrentlyActiveToken() async {
    List<Map<String, dynamic>> queryResult = await database.query(
      DatabaseConstant.tableAccessTokenName,
      where: 'is_active = 1',
      limit: 1,
    );
    return AccessTokenEntity.fromJson(queryResult.first);
  }
}
