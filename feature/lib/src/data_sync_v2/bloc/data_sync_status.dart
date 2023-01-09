import 'package:core_model/core_model.dart';

abstract class DataSyncV2Status {}

class LoadingCachedContent implements DataSyncV2Status {
  const LoadingCachedContent();
}

class NoContent implements DataSyncV2Status {
  const NoContent();
}

class Content implements DataSyncV2Status {
  final List<Book> books;

  const Content(this.books);
}

class Fetching implements DataSyncV2Status {
  final String title;
  final double? progress;

  const Fetching(this.title, {this.progress});
}