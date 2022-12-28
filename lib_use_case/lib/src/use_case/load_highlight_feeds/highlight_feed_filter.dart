class HighlightFeedFilter {
  final int bookId;
  final String author;
  final String? searchTerm;

  const HighlightFeedFilter({
    required this.bookId,
    required this.author,
    this.searchTerm,
  });
}
