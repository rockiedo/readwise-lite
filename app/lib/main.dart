import 'package:app/navigation/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lib_di/lib_di.dart';
import 'package:lib_use_case/lib_use_case.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDataDi(getIt);
  setupLibUseCaseDi(getIt);

  runApp(const ReadwiseApp());
}

class ReadwiseApp extends StatelessWidget {
  const ReadwiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Readwise lite',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
    );
  }
}
