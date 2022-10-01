import 'package:core_model/core_model.dart';
import 'package:core_network/core_network.dart';

extension BookMapper on NetworkBook {
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
}
