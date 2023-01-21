import 'package:core_data/core_data.dart';
import 'package:feature/src/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final AccessTokenRepository _accessTokenRepository;

  HomeCubit(
    this._accessTokenRepository,
  ) : super(const HomeState(HomeStatus.loading));

  Future load() async {
    final accessToken = await _accessTokenRepository.loadAccessToken();
    if (accessToken == null) {
      emit(const HomeState(HomeStatus.noAccessToken));
      return;
    }

    emit(const HomeState(HomeStatus.content));
  }
}
