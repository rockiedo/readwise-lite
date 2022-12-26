import 'package:feature/src/data_sync/bloc/book_sync_state.dart';
import 'package:feature/src/data_sync/bloc/data_sync_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class DataSyncCubit extends Cubit<DataSyncState> {
  final GetAccessTokenUseCase getLatestAccessTokenUseCase;
  final FetchRemoteBooksUseCase fetchRemoteBooksUseCase;
  final GetLocalBooksUseCase getLocalBooksUseCase;

  DataSyncCubit(
    this.getLatestAccessTokenUseCase,
    this.fetchRemoteBooksUseCase,
    this.getLocalBooksUseCase,
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

  Future fetchFeed(String? lastSync) async {
    emit(state.copyWith(isDownloadingBooks: true));

    try {
      await fetchRemoteBooksUseCase.invoke(lastSync);

      final books = await getLocalBooksUseCase.invoke();
      for (var book in books) {
        await _fetchHighLightsFromBook(book.id);
      }
    } catch (e) {
      // Do nothing
    }
  }

  Future _loadLocalBooksInternally() async {
    try {
      final books = await getLocalBooksUseCase.invoke();

      final bookStats = books
          .map(
            (e) => BookSyncState(
              bookId: e.id,
              bookName: e.title,
              isDownloading: false,
            ),
          )
          .toList();

      emit(state.copyWith(bookStates: bookStats, isDownloadingBooks: false));
    } catch (e) {
      // Do nothing
    }
  }

  Future _fetchHighLightsFromBook(int bookId) async {

  }
}
