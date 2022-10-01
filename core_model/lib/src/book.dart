class Book {
  final int id;
  final String title;
  final String? author;
  final String category;
  final String source;
  final int numHighlights;
  final String? lastHighlightAt;
  final String updated;
  final String coverImageUrl;
  final String highlightsUrl;
  final String? sourceUrl;
  final String? asin;
  final List<String> tags;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.source,
    required this.numHighlights,
    required this.lastHighlightAt,
    required this.updated,
    required this.coverImageUrl,
    required this.highlightsUrl,
    required this.sourceUrl,
    required this.asin,
    required this.tags,
  });
}