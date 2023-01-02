import 'package:feature/src/feed_filter/bloc/feed_filter_chip.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_state.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class FeedFilterCubit extends Cubit<FeedFilterState> {
  FeedFilterCubit()
      : super(
          const FeedFilterState(
            HighlightFeedFilter(),
            chips: [
              FeedFilterChip(FeedFilterType.book, 'book 1'),
              FeedFilterChip(FeedFilterType.author, 'author 1'),
              FeedFilterChip(FeedFilterType.defaultBook, 'Books'),
              FeedFilterChip(FeedFilterType.defaultAuthor, 'Authors'),
            ],
          ),
        );
}
