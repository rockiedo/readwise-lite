import 'package:core_database/core_database.dart';
import 'package:core_network/core_network.dart';

extension NetworkBookMapper on NetworkBook {
  BookEntity toEntity(String accessToken) {
    return BookEntity(
      id: id,
      title: title,
      author: author,
      category: category,
      source: source,
      numHighlights: numHighlights,
      lastHighlightAt: lastHighlightAt,
      updated: updated,
      coverImageUrl: coverImageUrl,
      highlightsUrl: highlightsUrl,
      sourceUrl: sourceUrl,
      accessToken: accessToken,
    );
  }
}