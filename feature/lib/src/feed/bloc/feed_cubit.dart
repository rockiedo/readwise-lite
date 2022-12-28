import 'package:feature/src/feed/bloc/feed_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class FeedCubit extends Cubit<FeedState> {
  final GetAccessTokenUseCase getLatestAccessTokenUseCase;
  final GetLocalBooksUseCase getLocalBooksUseCase;

  FeedCubit(
    this.getLatestAccessTokenUseCase,
    this.getLocalBooksUseCase,
  ) : super(const FeedState(FeedStatus.loading));

  Future loadFeed() async {
    try {
      final accessToken = await getLatestAccessTokenUseCase.invoke();
      if (accessToken == null) {
        emit(const FeedState(FeedStatus.noAccessToken));
        return;
      }

      final cachedBooks = await getLocalBooksUseCase.invoke();
      if (cachedBooks.isNotEmpty) {
        emit(FeedState(FeedStatus.content, books: cachedBooks));
        return;
      }

      emit(const FeedState(FeedStatus.outdatedCache, lastSync: null));
    } catch (e) {
      emit(const FeedState(FeedStatus.unknownError));
    }
  }
}
