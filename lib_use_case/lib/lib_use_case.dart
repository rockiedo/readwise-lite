library lib_use_case;

import 'package:get_it/get_it.dart';
import 'package:lib_use_case/src/di/di.dart';

export 'src/use_case/fetch_books_use_case.dart';
export 'src/use_case/get_local_books_use_case.dart';
export 'src/use_case/load_highlight_feeds/highlight_feed.dart';
export 'src/use_case/load_highlight_feeds/highlight_feed_filter.dart';
export 'src/use_case/load_highlight_feeds/load_highlight_feeds_use_case.dart';

void setupLibUseCaseDi(GetIt getIt) {
  configureDependencies(getIt);
}
