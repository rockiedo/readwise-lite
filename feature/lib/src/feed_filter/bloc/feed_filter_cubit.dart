import 'package:feature/src/feed_filter/bloc/feed_filter_chip.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_state.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class FeedFilterCubit extends Cubit<FeedFilterState> {
  static const _defaultChips = [
    FeedFilterChip(FeedFilterType.defaultBook, 'Books', 'Books'),
    FeedFilterChip(FeedFilterType.defaultAuthor, 'Authors', 'Authors'),
  ];

  final GetLocalBooksUseCase getLocalBooksUseCase;

  final Map<int, String> _selectableBooks = {};
  final Set<String> _selectableAuthors = {};

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
    _selectableBooks.addEntries(
      books.map((book) => MapEntry(book.id, book.title)),
    );

    final distinctAuthors = books
        .where((book) => book.author?.isNotEmpty == true)
        .map((book) => book.author!)
        .toSet();
    _selectableAuthors.clear();
    _selectableAuthors.addAll(distinctAuthors);
  }

  Map<int, String> getSelectableBooks() {
    return _selectableBooks;
  }

  Set<String> getSelectableAuthors() {
    return _selectableAuthors;
  }

  void onBookSelectionChanged(Set<Object> bookIds) {
    final newFilter = HighlightFeedFilter(
      bookIds: bookIds.map((e) => e as int).toList(),
      authors: state.filter.authors,
      searchTerm: state.filter.searchTerm,
    );
    _emitNewFilter(newFilter);
  }

  void onAuthorSelectionChanged(Set<Object> authors) {
    final newFilter = HighlightFeedFilter(
      bookIds: state.filter.bookIds,
      authors: authors.map((e) => e as String).toList(),
      searchTerm: state.filter.searchTerm,
    );
    _emitNewFilter(newFilter);
  }

  void deleteChip(Object id, FeedFilterType type) {
    if (type == FeedFilterType.book) {
      _deleteBookChip(id);
      return;
    }

    _deleteAuthorChip(id);
  }

  void _deleteBookChip(Object id) {
    final newFilter = HighlightFeedFilter(
      bookIds: state.filter.bookIds?.where((element) => element != id).toList(),
      authors: state.filter.authors,
      searchTerm: state.filter.searchTerm,
    );
    _emitNewFilter(newFilter);
  }

  void _deleteAuthorChip(Object id) {
    final newFilter = HighlightFeedFilter(
      bookIds: state.filter.bookIds,
      authors: state.filter.authors?.where((element) => element != id).toList(),
      searchTerm: state.filter.searchTerm,
    );
    _emitNewFilter(newFilter);
  }

  void _emitNewFilter(HighlightFeedFilter filter) {
    final chips = <FeedFilterChip>[..._defaultChips];

    filter.bookIds?.forEach(
      (id) {
        chips.add(
          FeedFilterChip(FeedFilterType.book, _selectableBooks[id]!, id),
        );
      },
    );

    filter.authors?.forEach(
      (author) {
        chips.add(
          FeedFilterChip(
            FeedFilterType.author,
            author,
            author,
          ),
        );
      },
    );

    emit(FeedFilterState(filter, chips: chips));
  }
}
