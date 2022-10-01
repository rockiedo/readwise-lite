import 'package:core_model/core_model.dart';
import 'package:feature_book_list/feature_book_list.dart';
import 'package:feature_book_list/src/ui/book_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:lib_use_case/lib_use_case.dart';

class BookListWidget extends StatelessWidget {
  const BookListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
      future: featureBookListSl.get<GetAllBooksUseCase>().getAllBooksSingle(),
      builder: (context, snapshot) => _renderBookList(context, snapshot),
    );
  }

  Widget _renderBookList(
      BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
    if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
      return ListView.builder(
        itemBuilder: (listContext, index) {
          return BookTileWidget(book: snapshot.data![index]);
        },
        itemCount: snapshot.data!.length,
      );
    }

    return const Center(child: CircularProgressIndicator());
  }
}
