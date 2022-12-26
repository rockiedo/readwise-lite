import 'package:feature/src/data_sync/bloc/book_sync_state.dart';
import 'package:feature/src/data_sync/bloc/data_sync_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class DataSyncCubit extends Cubit<DataSyncState> {
  final GetAccessTokenUseCase getLatestAccessTokenUseCase;
  final FetchBooksUseCase fetchRemoteBooksUseCase;
  final GetLocalBooksUseCase getLocalBooksUseCase;

  DataSyncCubit(
    this.getLatestAccessTokenUseCase,
    this.fetchRemoteBooksUseCase,
    this.getLocalBooksUseCase,
  ) : super(
          DataSyncState(
            bookStates: List.empty(),
            isDownloadingBooks: false,
            booksInSync: {},
          ),
        );

  Future loadLocalBooks() async {
    emit(state.copyWith(isDownloadingBooks: true));
    await _loadLocalBooksInternally();
  }

  Future fetchFeed(String? lastSync) async {
    emit(state.copyWith(isDownloadingBooks: true));

    try {
      await fetchRemoteBooksUseCase.invoke();

      final books = await getLocalBooksUseCase.invoke();
      final bookStates = books.map(
        (e) => BookSyncState(
          bookId: e.id,
          bookName: e.title,
        ),
      ).toList();

      emit(state.copyWith(bookStates: bookStates, isDownloadingBooks: false));
    } catch (e) {
      // Do nothing
    }
  }

  Future fetchHighlightsFromBook(int bookId) async {
    final booksInSync = {...state.booksInSync};
    booksInSync.add(bookId);
    emit(state.copyWith(booksInSync: booksInSync));
  }

  Future _loadLocalBooksInternally() async {
    try {
      final books = await getLocalBooksUseCase.invoke();

      final bookStats = books
          .map(
            (e) => BookSyncState(
              bookId: e.id,
              bookName: e.title,
            ),
          )
          .toList();

      emit(state.copyWith(bookStates: bookStats, isDownloadingBooks: false));
    } catch (e) {
      // Do nothing
    }
  }

  Future _fetchHighLightsFromBook(int bookId) async {}
}
