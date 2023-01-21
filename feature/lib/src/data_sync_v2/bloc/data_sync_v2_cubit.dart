import 'package:core_data/core_data.dart';
import 'package:core_model/core_model.dart';
import 'package:feature/src/data_sync_v2/bloc/book_sync_status.dart';
import 'package:feature/src/data_sync_v2/bloc/data_sync_status.dart';
import 'package:feature/src/data_sync_v2/bloc/data_sync_v2_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class DataSyncV2Cubit extends Cubit<DataSyncV2State> {
  final GetLocalBooksUseCase _getLocalBooksUseCase;
  final FetchBooksUseCase _fetchBooksUseCase;
  final HighlightRepository _highlightRepository;

  DataSyncV2Cubit(
    this._getLocalBooksUseCase,
    this._fetchBooksUseCase,
    this._highlightRepository,
  ) : super(const DataSyncV2State(LoadingCachedContent()));

  void loadLocalBooks() async {
    emit(const DataSyncV2State(LoadingCachedContent()));
    _loadLocalBooksInternally();
  }

  void fetchBookMetadata() async {
    emit(const DataSyncV2State(Fetching('Fetching books')));
    List<Book> books = await _fetchBooksUseCase.invoke();

    if (books.isEmpty) {
      _loadLocalBooksInternally();
      return;
    }

    final bookSyncStatuses = await _mapToBookSyncStatuses(books);
    emit(DataSyncV2State(Content(bookSyncStatuses)));
    emit(DataSyncV2State(Content(bookSyncStatuses)));
  }

  void fetchHighlightsFromBook(int id, String title) async {
    emit(DataSyncV2State(Fetching('Fetching highlights from $title')));
    await _highlightRepository.fetchHighlightsFromBook(id);
    _loadLocalBooksInternally();
  }

  void _loadLocalBooksInternally() async {
    final books = await _getLocalBooksUseCase.invoke();
    final bookSyncStatuses = await _mapToBookSyncStatuses(books);

    if (bookSyncStatuses.isEmpty) {
      emit(const DataSyncV2State(NoContent()));
      return;
    }

    emit(DataSyncV2State(Content(bookSyncStatuses)));
  }

  Future<List<BookSyncStatus>> _mapToBookSyncStatuses(List<Book> books) async {
    final highlightCount = await _highlightRepository.countHighlightPerBook();
    final bookSyncStatuses = books
        .map(
          (e) => BookSyncStatus(
            e.id,
            e.title,
            e.coverImageUrl,
            e.numHighlights,
            highlightCount[e.id] ?? 0,
            e.updated,
          ),
        )
        .toList();
    return bookSyncStatuses;
  }
}
