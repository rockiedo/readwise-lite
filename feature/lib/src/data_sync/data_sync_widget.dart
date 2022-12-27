import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:feature/src/data_sync/bloc/book_sync_state.dart';
import 'package:feature/src/data_sync/bloc/data_sync_cubit.dart';
import 'package:feature/src/data_sync/bloc/data_sync_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:lib_use_case/lib_use_case.dart';

class DataSyncWidget extends StatelessWidget {
  const DataSyncWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = DataSyncCubit(
          GetIt.instance.get<GetAccessTokenUseCase>(),
          GetIt.instance.get<FetchBooksUseCase>(),
          GetIt.instance.get<GetLocalBooksUseCase>(),
          GetIt.instance.get<FetchHighlightsFromBookUseCase>(),
        );

        cubit.loadLocalBooks();
        return cubit;
      },
      child: Scaffold(
        body: const SafeArea(
          child: _DataSyncContent(),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: () {
              context.pop();
            },
          ),
          title: const Text('Data sync'),
        ),
      ),
    );
  }
}

class _DataSyncContent extends StatelessWidget {
  const _DataSyncContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataSyncCubit, DataSyncState>(
      builder: (innerContext, state) {
        if (state.isDownloadingBooks) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.separated(
          itemBuilder: (_, index) {
            final bookSyncState = state.bookStates[index];
            return _BookSyncTile(bookSyncState);
          },
          separatorBuilder: (_, index) {
            return const Divider();
          },
          itemCount: state.bookStates.length,
        );
      },
    );
  }
}

class _BookSyncTile extends StatefulWidget {
  final BookSyncState bookSyncState;

  const _BookSyncTile(
    this.bookSyncState, {
    Key? key,
  }) : super(key: key);

  @override
  State<_BookSyncTile> createState() => _BookSyncTileState();
}

class _BookSyncTileState extends State<_BookSyncTile> {
  bool isFetching = false;
  StreamSubscription<dynamic>? subscription;

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.bookSyncState.coverUrl == null
          ? SizedBox.fromSize(
              size: const Size(60, 80),
              child: const Placeholder(),
            )
          : CachedNetworkImage(
              height: 80,
              width: 60,
              imageUrl: widget.bookSyncState.coverUrl!,
            ),
      trailing: isFetching
          ? IconButton(
              onPressed: _cancelFetch,
              icon: const Icon(Icons.cancel_outlined),
            )
          : IconButton(
              onPressed: _fetchHighlights,
              icon: const Icon(Icons.download),
            ),
      title: Text(widget.bookSyncState.bookTitle),
      subtitle: isFetching
          ? const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: LinearProgressIndicator(),
          )
          : const Text('Sync just now'),
    );
  }

  void _fetchHighlights() {
    subscription = context
        .read<DataSyncCubit>()
        .fetchHighLightsFromBook(widget.bookSyncState.bookId)
        .asStream()
        .listen((event) {
      setState(() {
        isFetching = false;
      });
    });

    setState(() {
      isFetching = true;
    });
  }

  void _cancelFetch() {
    subscription?.cancel();
    setState(() {
      isFetching = false;
    });
  }
}
