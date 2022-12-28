import 'package:cached_network_image/cached_network_image.dart';
import 'package:core_model/core_model.dart';
import 'package:feature/src/data_sync/data_sync_widget.dart';
import 'package:feature/src/feed/bloc/feed_cubit.dart';
import 'package:feature/src/feed/bloc/feed_state.dart';
import 'package:feature/src/settings/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lib_use_case/lib_use_case.dart';

class FeedWidget extends StatelessWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = FeedCubit(
          GetIt.instance.get<GetAccessTokenUseCase>(),
          GetIt.instance.get<GetLocalBooksUseCase>(),
        );

        cubit.loadFeed();
        return cubit;
      },
      child: const Scaffold(
        body: SafeArea(child: _FeedContentWidget()),
        floatingActionButton: _FeedFabWidget(),
      ),
    );
  }
}

class _FeedContentWidget extends StatelessWidget {
  const _FeedContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedCubit, FeedState>(
      builder: (innerContext, state) {
        final cubit = innerContext.read<FeedCubit>();

        if (state.status == FeedStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == FeedStatus.content) {
          return _BookListWidget(state.books!);
        }

        if (state.status == FeedStatus.noAccessToken) {
          return _PlaceHolderWidget(
            desc: 'No access token, please set one in settings!',
            ctaText: 'Settings',
            clickToAction: () {
              _goToSettings(innerContext);
            },
          );
        }

        if (state.status == FeedStatus.outdatedCache) {
          return _PlaceHolderWidget(
            desc: 'The content is outdated, please sync the latest content!',
            ctaText: 'Sync',
            clickToAction: () {
              _goToDataSync(innerContext);
            },
          );
        }

        return _PlaceHolderWidget(
          desc: 'An error has occurred, please retry!',
          ctaText: 'Retry',
          clickToAction: () {
            cubit.loadFeed();
          },
        );
      },
    );
  }

  void _goToDataSync(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (newContext) => const DataSyncWidget()),
    ).then((value) => context.read<FeedCubit>().loadFeed());
  }

  void _goToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (newContext) => const SettingsWidget()),
    ).then((value) => context.read<FeedCubit>().loadFeed());
  }
}

class _FeedFabWidget extends StatelessWidget {
  const _FeedFabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedCubit, FeedState>(
      builder: (innerContext, state) {
        return Visibility(
          visible: state.status == FeedStatus.content,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DataSyncWidget()),
              ).then(
                (value) => innerContext.read<FeedCubit>().loadFeed(),
              );
            },
            child: const Icon(Icons.sync),
          ),
        );
      },
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

class _PlaceHolderWidget extends StatelessWidget {
  final String desc;
  final String ctaText;
  final VoidCallback clickToAction;

  const _PlaceHolderWidget({
    required this.desc,
    required this.ctaText,
    required this.clickToAction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            desc,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox.fromSize(size: const Size.fromHeight(16)),
          OutlinedButton(
            onPressed: clickToAction,
            child: Text(ctaText),
          ),
        ],
      ),
    );
  }
}
