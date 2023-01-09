import 'package:cached_network_image/cached_network_image.dart';
import 'package:feature/src/data_sync_v2/bloc/book_sync_status.dart';
import 'package:feature/src/data_sync_v2/bloc/data_sync_status.dart';
import 'package:feature/src/data_sync_v2/bloc/data_sync_v2_cubit.dart';
import 'package:feature/src/data_sync_v2/bloc/data_sync_v2_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lib_use_case/lib_use_case.dart';

class DataSyncV2Widget extends StatelessWidget {
  const DataSyncV2Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = DataSyncV2Cubit(
          GetIt.instance.get<GetLocalBooksUseCase>(),
          GetIt.instance.get<FetchBooksUseCase>(),
          GetIt.instance.get<CountHighlightPerBookUseCase>(),
        );
        cubit.loadLocalBooks();
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: () {
              context.pop();
            },
          ),
          title: const Text('Data sync'),
        ),
        body: const _DataSyncContent(),
        floatingActionButton: const _DataSyncFab(),
      ),
    );
  }
}

class _DataSyncContent extends StatelessWidget {
  const _DataSyncContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataSyncV2Cubit, DataSyncV2State>(
      builder: (innerContext, state) {
        if (state.status is LoadingCachedContent) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status is NoContent) {
          return const _NoContentWidget();
        }

        if (state.status is Content) {
          final content = state.status as Content;

          return ListView.separated(
            itemBuilder: (_, index) {
              return _BookTile(content.books[index]);
            },
            separatorBuilder: (_, index) {
              return const Divider();
            },
            itemCount: content.books.length,
          );
        }

        if (state.status is Fetching) {
          return _FetchingContentWidget(state.status as Fetching);
        }

        return const Placeholder();
      },
    );
  }
}

class _NoContentWidget extends StatelessWidget {
  const _NoContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'No content found locally',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextButton(
              onPressed: () {
                context.read<DataSyncV2Cubit>().fetch();
              },
              child: const Text('Download'))
        ],
      ),
    );
  }
}

class _BookTile extends StatelessWidget {
  final BookSyncStatus _status;

  const _BookTile(this._status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? displayableUpdate;
    try {
      final dateFormat = DateFormat('yy-MM-dd');
      displayableUpdate = dateFormat.format(DateTime.parse(_status.updatedAt));
    } on FormatException catch (_) {
      // Silent fail
    }

    return ListTile(
      leading: CachedNetworkImage(
        height: 80,
        width: 60,
        imageUrl: _status.coverImageUrl,
      ),
      title: Text(_status.bookTitle),
      subtitle: Text(
        '${_status.fetchedHighlightCount} of ${_status.totalHighlightCount} downloaded',
      ),
    );
  }
}

class _FetchingContentWidget extends StatelessWidget {
  final Fetching _state;

  const _FetchingContentWidget(this._state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _state.title,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: LinearProgressIndicator(value: _state.progress),
          ),
        ],
      ),
    );
  }
}

class _DataSyncFab extends StatelessWidget {
  const _DataSyncFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataSyncV2Cubit, DataSyncV2State>(
      builder: (innerContext, state) {
        return Visibility(
          visible: state.status is Content,
          child: FloatingActionButton(
            child: const Icon(Icons.cloud_download_outlined),
            onPressed: () {
              context.read<DataSyncV2Cubit>().fetch();
            },
          ),
        );
      },
    );
  }
}
