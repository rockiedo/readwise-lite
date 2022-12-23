import 'package:feature/src/data_sync/bloc/data_sync_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class DataSyncCubit extends Cubit<DataSyncState> {
  final GetLatestAccessTokenUseCase getLatestAccessTokenUseCase;
  final FetchRemoteBooksUseCase fetchRemoteBooksUseCase;

  DataSyncCubit(
      this.getLatestAccessTokenUseCase,
      this.fetchRemoteBooksUseCase,
      ) : super(
    DataSyncState(
      bookStates: List.empty(),
      isDownloadingBooks: false,
    ),
  );

  Future fetchFeed(String? lastSync) async {
    // emit(state.copyWith(status: FeedStatus.loading));

    try {
      final accessToken = await getLatestAccessTokenUseCase.invoke();
      await fetchRemoteBooksUseCase.invoke(accessToken!, lastSync: lastSync);
    } catch (e) {
      // emit(const FeedState(FeedStatus.unknownError));
    }
  }
}