import 'package:core_database/src/database_constant.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<void> setupDatabase(GetIt getIt) async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await openDatabase(
    join(await getDatabasesPath(), 'app_database.db'),
    version: DatabaseConstant.dbVersion,
    onCreate: (db, version) {
      db.execute(DatabaseConstant.tableAccessTokenV1);
      db.execute(DatabaseConstant.tableBookV1);
    },
  );

  getIt.registerSingleton<Database>(database);
}