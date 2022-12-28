import 'package:feature/src/data_sync/bloc/book_sync_state.dart';
import 'package:feature/src/data_sync/bloc/data_sync_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class DataSyncCubit extends Cubit<DataSyncState> {
  final GetAccessTokenUseCase getLatestAccessTokenUseCase;
  final FetchBooksUseCase fetchRemoteBooksUseCase;
  final GetLocalBooksUseCase getLocalBooksUseCase;
  final FetchHighlightsFromBookUseCase fetchHighlightsFromBookUseCase;

  DataSyncCubit(
    this.getLatestAccessTokenUseCase,
    this.fetchRemoteBooksUseCase,
    this.getLocalBooksUseCase,
    this.fetchHighlightsFromBookUseCase,
  ) : super(
          DataSyncState(
            bookStates: List.empty(),
            isDownloadingBooks: false,
          ),
        );

  Future loadLocalBooks() async {
    emit(state.copyWith(isDownloadingBooks: true));
    await _loadLocalBooksInternally();
  }

  Future fetchAll(String? lastSync) async {
    emit(state.copyWith(isDownloadingBooks: true));

    try {
      await fetchRemoteBooksUseCase.invoke();

      final books = await getLocalBooksUseCase.invoke();
      final bookStates = books
          .map(
            (e) => BookSyncState(
              bookId: e.id,
              bookTitle: e.title,
              coverUrl: e.coverImageUrl,
            ),
          )
          .toList();

      emit(state.copyWith(bookStates: bookStates, isDownloadingBooks: false));
    } catch (e) {
      // Do nothing
    }
  }

  Future fetchHighLightsFromBook(int bookId) {
    return fetchHighlightsFromBookUseCase.invoke(bookId);
  }

  Future _loadLocalBooksInternally() async {
    try {
      final books = await getLocalBooksUseCase.invoke();

      final bookStats = books
          .map(
            (e) => BookSyncState(
              bookId: e.id,
              bookTitle: e.title,
              coverUrl: e.coverImageUrl,
            ),
          )
          .toList();

      emit(state.copyWith(bookStates: bookStats, isDownloadingBooks: false));
    } catch (e) {
      // Do nothing
    }
  }
}
