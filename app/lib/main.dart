import 'package:feature_feed/feature_feed.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lib_di/lib_di.dart';
import 'package:lib_use_case/lib_use_case.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  await setupDataDi(getIt);
  setupLibUseCaseDi(getIt);

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
      home: const FeedWidget(),
    );
  }
}
