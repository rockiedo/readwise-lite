part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenStateImpl extends HomeScreenState {
  final int selectedIndex;

  HomeScreenStateImpl({this.selectedIndex = 0});
}
