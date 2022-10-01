import 'package:app/src/home/cubit/home_screen_cubit.dart';
import 'package:feature_book_list/feature_book_list.dart';
import 'package:feature_settings/feature_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NormalHomeScreen extends StatelessWidget {
  final HomeScreenCubit cubit;

  const NormalHomeScreen({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      bloc: cubit,
      builder: (context, state) {
        final selectedIndex =
            state is HomeScreenStateImpl ? state.selectedIndex : 0;

        return Scaffold(
          body: selectedIndex == 0
              ? const BookListWidget()
              : const SettingsWidget(),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                activeIcon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: selectedIndex,
            onTap: (value) => cubit.selectIndex(value),
          ),
        );
      },
    );
  }
}
