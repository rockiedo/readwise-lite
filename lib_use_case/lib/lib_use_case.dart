library lib_use_case;

import 'package:get_it/get_it.dart';
import 'package:lib_use_case/src/di/di.dart';

export 'src/use_case/get_all_books_use_case.dart';
export 'src/use_case/get_latest_access_token_use_case.dart';
export 'src/use_case/save_access_token_use_case.dart';

void setupLibUseCaseDi(GetIt getIt) {
    configureDependencies(getIt);
}
