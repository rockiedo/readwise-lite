import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../database_constant.dart';
import '../model/book_entity.dart';

abstract class BookDao {
  Future<void> insertBooks(List<BookEntity> books);

  Future<List<BookEntity>> getBooks(String accessToken);
}

@Injectable(as: BookDao)
class BookDaoImpl extends BookDao {
  final Database _database;

  BookDaoImpl(this._database);

  @override
  Future<void> insertBooks(List<BookEntity> books) async {
    final batch = _database.batch();

    for (final book in books) {
      batch.insert(
        DatabaseConstant.tableBookName,
        book.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit();
  }

  @override
  Future<List<BookEntity>> getBooks(String accessToken) async {
    final List<Map<String, dynamic>> books =
        await _database.query(DatabaseConstant.tableBookName);

    return List.generate(
      books.length,
      (index) => BookEntity.fromJson(books[index]),
    );
  }
}
