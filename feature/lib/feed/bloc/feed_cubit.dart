import 'package:feature/feed/bloc/feed_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class FeedCubit extends Cubit<FeedState> {
  final GetLatestAccessTokenUseCase getLatestAccessTokenUseCase;
  final SyncLoggerUseCase logSyncUseCase;
  final GetLocalBooksUseCase getLocalBooksUseCase;
  final FetchRemoteBooksUseCase fetchRemoteBooksUseCase;

  FeedCubit(
    this.getLatestAccessTokenUseCase,
    this.logSyncUseCase,
    this.getLocalBooksUseCase,
    this.fetchRemoteBooksUseCase,
  ) : super(const FeedState(FeedStatus.loading));

  Future loadFeed() async {
    try {
      final accessToken = await getLatestAccessTokenUseCase.invoke();
      if (accessToken == null) {
        emit(const FeedState(FeedStatus.noAccessToken));
        return;
      }

      final cachedBooks = await getLocalBooksUseCase.invoke(accessToken);
      if (cachedBooks.isNotEmpty) {
        emit(FeedState(FeedStatus.content, books: cachedBooks));
        return;
      }

      final lastSync = await logSyncUseCase.getLastSync();
      emit(FeedState(FeedStatus.outdatedCache, lastSync: lastSync));
    } catch (e) {
      emit(const FeedState(FeedStatus.unknownError));
    }
  }

  Future fetchFeed(String? lastSync) async {
    emit(state.copyWith(status: FeedStatus.loading));

    try {
      final accessToken = await getLatestAccessTokenUseCase.invoke();
      if (accessToken == null) {
        emit(const FeedState(FeedStatus.noAccessToken));
        return;
      }

      await fetchRemoteBooksUseCase.invoke(accessToken, lastSync: lastSync);

      final cachedBooks = await getLocalBooksUseCase.invoke(accessToken);
      if (cachedBooks.isNotEmpty) {
        emit(FeedState(FeedStatus.content, books: cachedBooks));
        return;
      }
    } catch (e) {
      emit(const FeedState(FeedStatus.unknownError));
    }
  }
}
