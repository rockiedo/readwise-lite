import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:lib_use_case/src/di/di.config.dart';

@InjectableInit()
void configureDependencies(GetIt getIt) => getIt.init();