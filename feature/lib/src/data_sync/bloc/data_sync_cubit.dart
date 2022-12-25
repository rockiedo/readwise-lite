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
      final accessToken = await getLatestAccessTokenUseCase.invoke();
      await fetchRemoteBooksUseCase.invoke(accessToken!, lastSync: lastSync);
      await _loadLocalBooksInternally();
    } catch (e) {
      // Do nothing
    }
  }

  Future _loadLocalBooksInternally() async {
    try {
      final accessToken = await getLatestAccessTokenUseCase.invoke();
      final books = await getLocalBooksUseCase.invoke(accessToken!);

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
}
