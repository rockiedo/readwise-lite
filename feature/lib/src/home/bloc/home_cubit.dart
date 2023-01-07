import 'package:feature/src/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAccessTokenUseCase getLatestAccessTokenUseCase;
  final GetLocalBooksUseCase getLocalBooksUseCase;

  HomeCubit(
    this.getLatestAccessTokenUseCase,
    this.getLocalBooksUseCase,
  ) : super(const HomeState(HomeStatus.loading));

  Future loadFeed() async {
    try {
      final accessToken = await getLatestAccessTokenUseCase.invoke();
      if (accessToken == null) {
        emit(const HomeState(HomeStatus.noAccessToken));
        return;
      }

      final cachedBooks = await getLocalBooksUseCase.invoke();
      if (cachedBooks.isNotEmpty) {
        emit(HomeState(HomeStatus.content, books: cachedBooks));
        return;
      }

      emit(const HomeState(HomeStatus.outdatedCache, lastSync: null));
    } catch (e) {
      emit(const HomeState(HomeStatus.unknownError));
    }
  }
}
