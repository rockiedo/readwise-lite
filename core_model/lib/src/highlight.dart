class Highlight {
  final int id;
  final String text;
  final String? note;
  final int location;
  final String locationType;
  final String? highlightedAt;
  final String? url;
  final String? color;
  final String? updated;
  final int bookId;

  Highlight({
    required this.id,
    required this.text,
    required this.note,
    required this.location,
    required this.locationType,
    required this.highlightedAt,
    required this.url,
    required this.color,
    required this.updated,
    required this.bookId,
  });
}