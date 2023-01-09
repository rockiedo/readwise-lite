import 'package:core_model/core_model.dart';
import 'package:feature/src/data_sync_v2/bloc/data_sync_status.dart';
import 'package:feature/src/data_sync_v2/bloc/data_sync_v2_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class DataSyncV2Cubit extends Cubit<DataSyncV2State> {
  final GetLocalBooksUseCase _getLocalBooksUseCase;
  final FetchBooksUseCase _fetchBooksUseCase;
  final FetchHighlightsFromBookUseCase _fetchHighlightsFromBookUseCase;

  DataSyncV2Cubit(
    this._getLocalBooksUseCase,
    this._fetchBooksUseCase,
    this._fetchHighlightsFromBookUseCase,
  ) : super(const DataSyncV2State(LoadingCachedContent()));

  void loadLocalBooks() async {
    emit(const DataSyncV2State(LoadingCachedContent()));
    _loadLocalBooksInternally();
  }

  void fetch() async {
    emit(const DataSyncV2State(Fetching('Fetching books')));
    List<Book> books = await _fetchBooksUseCase.invoke();

    final total = books.length;
    for (int i = 0; i < books.length; i++) {
      final current = i + 1;
      emit(
        DataSyncV2State(
          Fetching(
            'Fetching highlights of $current/$total books',
            progress: current / total,
          ),
        ),
      );
      await _fetchHighlightsFromBookUseCase.invoke(books[i].id);
    }

    if (books.isEmpty) {
      _loadLocalBooksInternally();
      return;
    }

    emit(DataSyncV2State(Content(books)));
  }

  void _loadLocalBooksInternally() async {
    final books = await _getLocalBooksUseCase.invoke();

    if (books.isEmpty) {
      emit(const DataSyncV2State(NoContent()));
      return;
    }

    emit(DataSyncV2State(Content(books)));
  }
}
