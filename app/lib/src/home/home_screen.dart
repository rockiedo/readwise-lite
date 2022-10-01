import 'package:app/src/home/cubit/home_screen_cubit.dart';
import 'package:app/src/home/normal_home_screen.dart';
import 'package:app/src/home/wide_home_screen.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final cubit = HomeScreenCubit();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isWideScreen()
        ? WideHomeScreen(cubit: cubit)
        : NormalHomeScreen(cubit: cubit);
  }
}
