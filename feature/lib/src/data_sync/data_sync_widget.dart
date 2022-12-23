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
        return DataSyncCubit(
          GetIt.instance.get<GetLatestAccessTokenUseCase>(),
          GetIt.instance.get<FetchRemoteBooksUseCase>(),
        );
      },
      child: Scaffold(
        body: SafeArea(child: Container()),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              // context.push(AppRoute.home.path);
              context.pop();
            },
          ),
          title: const Text('Data sync'),
          actions: const [
            _SyncAllBooksWidget(),
          ],
        ),
      ),
    );
  }
}

class _SyncAllBooksWidget extends StatelessWidget {
  const _SyncAllBooksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataSyncCubit, DataSyncState>(
      builder: (innerContext, state) {
        return TextButton(
          onPressed: () {
            innerContext.read<DataSyncCubit>().fetchFeed(null);
          },
          child: Text(
            'SYNC ALL',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.black),
          ),
        );
      },
    );
  }
}
