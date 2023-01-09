import 'package:feature/src/data_sync_v2/bloc/data_sync_status.dart';
import 'package:feature/src/data_sync_v2/bloc/data_sync_v2_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class DataSyncV2Cubit extends Cubit<DataSyncV2State> {
  final GetLocalBooksUseCase _getLocalBooksUseCase;

  DataSyncV2Cubit(
    this._getLocalBooksUseCase,
  ) : super(const DataSyncV2State(DataSyncStatus.idle));

  void loadLocalBooks() async {
    emit(const DataSyncV2State(DataSyncStatus.loadingCachedContent));
    final books = await _getLocalBooksUseCase.invoke();
    emit(DataSyncV2State(DataSyncStatus.idle, books: books));
  }
}
