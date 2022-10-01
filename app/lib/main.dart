import 'package:app/src/home/home_screen.dart';
import 'package:core_data/core_data.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lib_use_case/lib_use_case.dart';

final sl = GetIt.instance;

void main() {
  setupCoreDataDi();
  setupLibUseCaseDi();

  runApp(const ReadwiseApp());
}

class ReadwiseApp extends StatelessWidget {
  const ReadwiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Readwise',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomeScreen(),
    );
  }
}
