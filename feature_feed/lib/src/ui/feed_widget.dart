import 'package:core_model/core_model.dart';
import 'package:feature_feed/src/ui/cubit/feed_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lib_use_case/lib_use_case.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'cubit/feed_state.dart';

class FeedWidget extends StatelessWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = FeedCubit(
          GetIt.instance.get<GetLatestAccessTokenUseCase>(),
          GetIt.instance.get<SyncLoggerUseCase>(),
          GetIt.instance.get<GetLocalBooksUseCase>(),
        );

        cubit.loadFeed();

        return cubit;
      },
      child: BlocBuilder<FeedCubit, FeedState>(
        builder: (innerContext, state) {
          if (state.status == FeedStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.status == FeedStatus.content) {
            return ListView.builder(
              itemBuilder: (listContext, index) {
                return _BookTileWidget(book: state.books![index]);
              },
              itemCount: state.books!.length,
            );
          }

          return Container();
        },
      ),
    );
  }
}

class _BookTileWidget extends StatelessWidget {
  final Book book;

  const _BookTileWidget({required this.book});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        leading: CachedNetworkImage(
          height: 80,
          width: 60,
          imageUrl: book.coverImageUrl,
        ),
        title: Text(book.title),
        subtitle: book.author != null ? Text(book.author!) : null,
        onTap: () {

        },
      ),
    );
  }
}