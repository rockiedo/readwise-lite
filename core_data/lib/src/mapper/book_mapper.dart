import 'package:core_database/core_database.dart';
import 'package:core_model/core_model.dart';
import 'package:core_network/core_network.dart';

extension NetworkBookMapper on NetworkBook {
  Book toExternalModel() {
    return Book(
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
      asin: asin,
      tags: tags,
    );
  }

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

extension BookEntityMapper on BookEntity {
  Book toExternalModel() {
    return Book(
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
      asin: null,
      tags: [],
    );
  }
}