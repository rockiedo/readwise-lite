class DatabaseConstant {
  static const dbVersion = 1;
  static const tableBookName = 'book';
  static const tableAccessTokenName = 'access_token';

  static const tableAccessTokenV1 = 'CREATE TABLE access_token(token TEXT PRIMARY KEY, is_active INTEGER)';

  static const tableBookV1 = 'CREATE TABLE book(id INTEGER PRIMARY KEY, title TEXT NOT NULL, author TEXT NOT NULL, category TEXT NOT NULL, source TEXT NOT NULL, num_highlights INTEGER NOT NULL, last_highlight_at TEXT, updated TEXT NOT NULL, cover_image_url TEXT NOT NULL, highlights_url TEXT NOT NULL, source_url TEXT, asin TEXT, access_token TEXT NOT NULL)';
}
