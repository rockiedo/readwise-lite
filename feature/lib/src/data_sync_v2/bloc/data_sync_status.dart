import 'package:feature/src/data_sync_v2/bloc/book_sync_status.dart';

abstract class DataSyncV2Status {}

class LoadingCachedContent implements DataSyncV2Status {
  const LoadingCachedContent();
}

class NoContent implements DataSyncV2Status {
  const NoContent();
}

class Content implements DataSyncV2Status {
  final List<BookSyncStatus> books;

  const Content(this.books);
}

class Fetching implements DataSyncV2Status {
  final String title;
  final double? progress;

  const Fetching(this.title, {this.progress});
}