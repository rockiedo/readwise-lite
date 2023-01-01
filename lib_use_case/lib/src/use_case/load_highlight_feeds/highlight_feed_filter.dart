class HighlightFeedFilter {
  final List<int>? bookIds;
  final List<String>? authors;
  final String? searchTerm;

  const HighlightFeedFilter({
    this.bookIds,
    this.authors,
    this.searchTerm,
  });
}
