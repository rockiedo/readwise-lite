import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenStateImpl());

  void selectIndex(index) {
    emit(HomeScreenStateImpl(selectedIndex: index));
  }
}
