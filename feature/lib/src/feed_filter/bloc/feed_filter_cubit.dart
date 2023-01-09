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

  final GetLocalBooksUseCase _getLocalBooksUseCase;

  final Map<int, String> _selectableBooks = {};
  final Set<String> _selectableAuthors = {};

  FeedFilterCubit(this._getLocalBooksUseCase)
      : super(
          const FeedFilterState(
            HighlightFeedFilter(),
            chips: _defaultChips,
          ),
        );

  Future loadSelectableOptions() async {
    final books = await _getLocalBooksUseCase.invoke();
    books.sort(
      (a, b) {
        final asc =
            DateTime.parse(a.updated).compareTo(DateTime.parse(b.updated));
        return -asc;
      },
    );

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
    final newFilter = state.filter.copyWith(
      bookIds: bookIds.map((e) => e as int).toList(),
    );
    _emitNewFilter(newFilter);
  }

  void onAuthorSelectionChanged(Set<Object> authors) {
    final newFilter = state.filter.copyWith(
      authors: authors.map((e) => e as String).toList(),
    );
    _emitNewFilter(newFilter);
  }

  void onSearchTermChanged(String term) {
    final newFilter = state.filter.copyWith(searchTerm: term);
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
    final newFilter = state.filter.copyWith(
      bookIds: state.filter.bookIds?.where((element) => element != id).toList(),
    );
    _emitNewFilter(newFilter);
  }

  void _deleteAuthorChip(Object id) {
    final newFilter = state.filter.copyWith(
      authors: state.filter.authors?.where((element) => element != id).toList(),
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
