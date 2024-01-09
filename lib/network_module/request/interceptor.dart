import 'package:flutter_core_kit/network_module/network/network_client.dart';
import 'package:flutter_core_kit/network_module/network/network_failure.dart';
import 'package:flutter_core_kit/network_module/request/request_api.dart';
import 'package:flutter_core_kit/network_module/utils/results.dart';

abstract class AppInterceptor {
  Future<Result<NetworkFailure, RequestApi>> onRequest(
    RequestApi api,
    NetworkClient client,
  );
}
