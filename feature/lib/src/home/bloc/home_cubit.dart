import 'package:feature/src/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAccessTokenUseCase _getLatestAccessTokenUseCase;

  HomeCubit(
    this._getLatestAccessTokenUseCase,
  ) : super(const HomeState(HomeStatus.loading));

  Future load() async {
    final accessToken = await _getLatestAccessTokenUseCase.invoke();
    if (accessToken == null) {
      emit(const HomeState(HomeStatus.noAccessToken));
      return;
    }

    emit(const HomeState(HomeStatus.content));
  }
}
