import 'package:core_database/src/database_constant.dart';
import 'package:core_database/src/di/di.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

export 'src/dao/access_token_dao.dart';
export 'src/dao/book_dao.dart';
export 'src/dao/highlight_dao.dart';
export 'src/model/access_token_entity.dart';
export 'src/model/book_entity.dart';
export 'src/model/highlight_entity.dart';

Future<void> setupDatabase(GetIt getIt) async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await openDatabase(
    join(await getDatabasesPath(), 'app_database.db'),
    version: DatabaseConstant.dbVersion,
    onCreate: (db, version) {
      db.execute(DatabaseV1.tableAccessToken);
      db.execute(DatabaseV1.tableBook);
      db.execute(DatabaseV1.tableHighlight);
    },
  );

  getIt.registerSingleton<Database>(database);
  configureDependencies(getIt);
}