import 'package:core_database/core_database.dart';
import 'package:core_network/core_network.dart';

extension NetworkHighlightMapper on NetworkHighlight {
  HighlightEntity toEntity() {
    return HighlightEntity(
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
