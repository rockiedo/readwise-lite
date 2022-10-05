import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../database_constant.dart';
import '../model/book_entity.dart';

abstract class BookDao {
  Future<void> insertBooks(List<BookEntity> books);
}

@Injectable(as: BookDao)
class BookDaoImpl extends BookDao {
  final Database database;

  BookDaoImpl(this.database);

  @override
  Future<void> insertBooks(List<BookEntity> books) async {
    final batch = database.batch();

    for (final book in books) {
      batch.insert(DatabaseConstant.tableBookName, book.toJson());
    }
    
    await batch.commit();
  }
}
