import 'package:feature_book_list/src/ui/book_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lib_use_case/lib_use_case.dart';

import 'cubit/book_list_cubit.dart';

class BookListWidget extends StatelessWidget {
  const BookListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookListCubit(
          GetIt.instance.get<GetLatestAccessTokenUseCase>(),
          GetIt.instance.get<GetLocalBooksUseCase>(),
      ),
      child: _BookListBuilder(),
    );
  }
}

class _BookListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<BookListCubit>().getLocalBooks(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemBuilder: (listContext, index) {
              return BookTileWidget(book: snapshot.data![index]);
            },
            itemCount: snapshot.data!.length,
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
