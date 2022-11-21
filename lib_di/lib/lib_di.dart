library lib_di;

import 'package:core_data/core_data.dart';
import 'package:get_it/get_it.dart';

Future<void> setupDataDi(GetIt getIt) {
  return setupCoreDataDi(getIt);
}
