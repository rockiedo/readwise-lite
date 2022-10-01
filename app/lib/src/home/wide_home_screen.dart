import 'package:app/src/home/cubit/home_screen_cubit.dart';
import 'package:feature_book_list/feature_book_list.dart';
import 'package:feature_settings/feature_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WideHomeScreen extends StatelessWidget {
  final HomeScreenCubit cubit;

  const WideHomeScreen({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        bloc: cubit,
        builder: (context, state) {
          final selectedIndex =
              state is HomeScreenStateImpl ? state.selectedIndex : 0;

          return Row(
            children: [
              NavigationRail(
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) => cubit.selectIndex(value),
                destinations: const <NavigationRailDestination>[
                  NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home_filled),
                      label: Text('Home')),
                  NavigationRailDestination(
                      icon: Icon(Icons.settings_outlined),
                      selectedIcon: Icon(Icons.settings),
                      label: Text('Settings')),
                ],
              ),
              Expanded(
                child: selectedIndex == 0
                    ? const BookListWidget()
                    : const SettingsWidget(),
              ),
            ],
          );
        },
      ),
    );
  }
}
