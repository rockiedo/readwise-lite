import 'package:cached_network_image/cached_network_image.dart';
import 'package:core_model/core_model.dart';
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
        if (state.status == DataSyncStatus.loadingCachedContent) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == DataSyncStatus.idle &&
            state.books?.isNotEmpty == true) {
          return ListView.separated(
            itemBuilder: (_, index) {
              return _BookTile(state.books![index]);
            },
            separatorBuilder: (_, index) {
              return const Divider();
            },
            itemCount: state.books!.length,
          );
        }

        return const Placeholder();
      },
    );
  }
}

class _BookTile extends StatelessWidget {
  final Book _book;

  const _BookTile(this._book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? displayableUpdate;
    try {
      final dateFormat = DateFormat('yy-MM-dd');
      displayableUpdate = dateFormat.format(DateTime.parse(_book.updated));
    } on FormatException catch (_, e) {
      // Silent fail
    }

    return ListTile(
      leading: CachedNetworkImage(
        height: 80,
        width: 60,
        imageUrl: _book.coverImageUrl,
      ),
      title: Text(_book.title),
      subtitle: displayableUpdate != null ? Text('Last update $displayableUpdate') : null,
    );
  }
}
