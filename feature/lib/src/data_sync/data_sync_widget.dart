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
        );

        cubit.loadLocalBooks();
        return cubit;
      },
      child: Scaffold(
        body: const SafeArea(child: _SyncDataContent()),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
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
        VoidCallback? onClick;
        if (!state.isDownloadingBooks) {
          onClick = () {
            innerContext.read<DataSyncCubit>().fetchFeed(null);
          };
        }

        return TextButton(
          onPressed: onClick,
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

class _SyncDataContent extends StatelessWidget {
  const _SyncDataContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataSyncCubit, DataSyncState>(
      builder: (innerContext, state) {
        if (state.isDownloadingBooks) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: state.bookStates.length,
          itemBuilder: (listContext, index) {
            return ListTile(title: Text(state.bookStates[index].bookName));
          },
        );
      },
    );
  }
}
