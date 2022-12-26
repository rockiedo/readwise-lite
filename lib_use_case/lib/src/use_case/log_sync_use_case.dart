import 'package:core_data/core_data.dart';
import 'package:injectable/injectable.dart';

abstract class SyncLoggerUseCase {
  Future<String?> getLastSync();
}

@Injectable(as: SyncLoggerUseCase)
class SyncLoggerUseCaseImpl extends SyncLoggerUseCase {
  final SyncLogRepository syncRepository;

  SyncLoggerUseCaseImpl(this.syncRepository);

  @override
  Future<String?> getLastSync() {
    return syncRepository.loadLastAllBooksSync();
  }
}