import 'package:feature/src/feed_filter/bloc/feed_filter_chip.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_state.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class FeedFilterCubit extends Cubit<FeedFilterState> {
  static const _defaultChips = [
    FeedFilterChip(FeedFilterType.defaultBook, 'Books'),
    FeedFilterChip(FeedFilterType.defaultAuthor, 'Authors'),
  ];

  final GetLocalBooksUseCase getLocalBooksUseCase;

  final List<MapEntry<int, String>> _selectableBooks = [];
  final List<MapEntry<int, String>> _selectableAuthors = [];

  FeedFilterCubit(this.getLocalBooksUseCase)
      : super(
          const FeedFilterState(
            HighlightFeedFilter(),
            chips: _defaultChips,
          ),
        );

  Future loadSelectableOptions() async {
    final books = await getLocalBooksUseCase.invoke();
    _selectableBooks.clear();
    _selectableBooks.addAll(
      books.map((book) => MapEntry(book.id, book.title)),
    );

    final distinctAuthors = books
        .where((book) => book.author?.isNotEmpty == true)
        .map((book) => book.author!)
        .toSet();
    _selectableAuthors.clear();
    _selectableAuthors.addAll(
      distinctAuthors.map((author) => MapEntry(author.hashCode, author)),
    );
  }

  List<MapEntry<int, String>> getSelectableBooks() {
    return _selectableBooks;
  }

  List<MapEntry<int, String>> getSelectableAuthors() {
    return _selectableAuthors;
  }

  void onBookSelectionChanged(Set<int> bookIds) {
    final newFilter = HighlightFeedFilter(
      bookIds: bookIds.toList(),
      authors: state.filter.authors,
      searchTerm: state.filter.searchTerm,
    );
    _emitNewFilter(newFilter);
  }

  void onAuthorSelectionChanged(Set<int> authorHashCode) {
  }

  void deleteBookChip(int id) {
    final newFilter = HighlightFeedFilter(
      bookIds: state.filter.bookIds?.where((element) => element != id).toList(),
      authors: state.filter.authors,
      searchTerm: state.filter.searchTerm,
    );
    _emitNewFilter(newFilter);
  }

  void deleteAuthorChip(int id) {
  }

  void _emitNewFilter(HighlightFeedFilter filter) {
    final chips = <FeedFilterChip>[];

    filter.bookIds?.forEach(
      (id) {
        chips.add(
          FeedFilterChip(FeedFilterType.book, id.toString(), id: id),
        );
      },
    );

    filter.authors?.forEach(
      (author) {
        chips.add(
          FeedFilterChip(FeedFilterType.author, author),
        );
      },
    );

    chips.addAll(_defaultChips);

    emit(FeedFilterState(filter, chips: chips));
  }
}
