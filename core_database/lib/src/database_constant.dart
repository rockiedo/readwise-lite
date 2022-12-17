class DatabaseConstant {
  static const dbVersion = 1;
  static const tableBookName = 'book';
  static const tableAccessTokenName = 'access_token';
  static const tableHighlightName = "highlight";
}

class DatabaseV1 {
  static const tableAccessToken = 'CREATE TABLE access_token(token TEXT PRIMARY KEY, alias TEXT NOT NULL, is_active INTEGER)';
  static const tableBook = 'CREATE TABLE book(id INTEGER PRIMARY KEY, title TEXT NOT NULL, author TEXT NOT NULL, category TEXT NOT NULL, source TEXT NOT NULL, num_highlights INTEGER NOT NULL, last_highlight_at TEXT, updated TEXT NOT NULL, cover_image_url TEXT NOT NULL, highlights_url TEXT NOT NULL, source_url TEXT, asin TEXT, access_token TEXT NOT NULL)';
  static const tableHighlight = 'CREATE TABLE highlight(id INTEGER PRIMARY KEY, text TEXT NOT NULL, note TEXT, location INTEGER NOT NULL, location_type TEXT NOT NULL, highlighted_at TEXT, url TEXT, color TEXT, updated TEXT, book_id INTEGER NOT NULL)';
}
