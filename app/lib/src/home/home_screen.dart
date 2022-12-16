import 'package:app/src/home/cubit/home_screen_cubit.dart';
import 'package:app/src/home/normal_home_screen.dart';
import 'package:app/src/home/wide_home_screen.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeScreenCubit(),
      child: context.isWideScreen()
          ? const WideHomeScreen()
          : const NormalHomeScreen(),
    );
  }
}
