import 'package:core_database/core_database.dart';
import 'package:core_model/core_model.dart';

extension HighlightEntityMapper on HighlightEntity {
  Highlight toExternalModel() {
    return Highlight(
      id: id,
      text: text,
      note: note,
      location: location,
      locationType: locationType,
      highlightedAt: highlightedAt,
      url: url,
      color: color,
      updated: updated,
      bookId: bookId,
    );
  }
}
