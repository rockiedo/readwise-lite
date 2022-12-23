import 'package:core_model/core_model.dart';
import 'package:feature/feed/bloc/feed_cubit.dart';
import 'package:feature/feed/bloc/feed_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lib_use_case/lib_use_case.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
          GetIt.instance.get<FetchRemoteBooksUseCase>(),
        );

        cubit.loadFeed();

        return cubit;
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<FeedCubit, FeedState>(
            builder: (innerContext, state) {
              if (state.status == FeedStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.status == FeedStatus.content) {
                return _BookListWidget(state.books!);
              }

              if (state.status == FeedStatus.noAccessToken) {
                return const _NoAccessTokenWidget();
              }

              if (state.status == FeedStatus.outdatedCache) {
                return _OutdatedContentWidget(state.lastSync);
              }

              return const Placeholder();
            },
          ),
        ),
      ),
    );
  }
}

class _BookListWidget extends StatelessWidget {
  final List<Book> books;

  const _BookListWidget(this.books);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (listContext, index) {
        return _BookTileWidget(books[index]);
      },
      itemCount: books.length,
    );
  }
}

class _BookTileWidget extends StatelessWidget {
  final Book book;

  const _BookTileWidget(this.book);

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
        onTap: () {},
      ),
    );
  }
}

class _NoAccessTokenWidget extends StatelessWidget {
  const _NoAccessTokenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'There is no access token. Set one to get started!',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox.fromSize(size: const Size.fromHeight(16)),
          OutlinedButton(
            onPressed: () {
            },
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }
}

class _OutdatedContentWidget extends StatelessWidget {
  final String? lastSync;

  const _OutdatedContentWidget(this.lastSync, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your content is outdated. Sync now!',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox.fromSize(size: const Size.fromHeight(16)),
          OutlinedButton(
            onPressed: () {
              context.read<FeedCubit>().fetchFeed(lastSync);
            },
            child: const Text('Sync'),
          ),
        ],
      ),
    );
  }
}
