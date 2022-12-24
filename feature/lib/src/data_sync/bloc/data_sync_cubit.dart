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
  }

  Future fetchFeed(String? lastSync) async {
    emit(state.copyWith(isDownloadingBooks: true));

    try {
      final accessToken = await getLatestAccessTokenUseCase.invoke();
      await fetchRemoteBooksUseCase.invoke(accessToken!, lastSync: lastSync);
    } catch (e) {
      // emit(const FeedState(FeedStatus.unknownError));
    }
  }
}
