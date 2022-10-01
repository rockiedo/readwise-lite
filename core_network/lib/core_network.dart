library core_network;

import 'package:core_network/src/readwise_client.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

export 'src/readwise_client.dart';
export 'src/model/network_book.dart';

final sl = GetIt.I;

void setupCoreNetworkDi() {
  final dio = Dio();
  dio.options.baseUrl = 'https://readwise.io/api/v2/';
  final readwiseClient = ReadwiseClient(dio);

  sl.registerSingleton<ReadwiseClient>(readwiseClient);
}