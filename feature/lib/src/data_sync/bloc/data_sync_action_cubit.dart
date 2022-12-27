import 'package:feature/src/data_sync/bloc/data_sync_action.dart';
import 'package:feature/src/data_sync/bloc/data_sync_action_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataSyncActionCubit extends Cubit<DataSyncActionState> {
  DataSyncActionCubit()
      : super(
          const DataSyncActionState(action: DataSyncAction.idle),
        );

  void triggerFetchAll() {
    emit(const DataSyncActionState(action: DataSyncAction.fetch));
    emit(const DataSyncActionState(action: DataSyncAction.idle));
  }
}
