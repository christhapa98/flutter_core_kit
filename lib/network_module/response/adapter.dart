import 'package:flutter_core_kit/entity/entity.dart';
import 'package:flutter_core_kit/network_module/network/network_client.dart';
import 'package:flutter_core_kit/network_module/network/network_failure.dart';
import 'package:flutter_core_kit/network_module/request/request_api.dart';
import 'package:flutter_core_kit/network_module/response/response_model.dart';
import 'package:flutter_core_kit/network_module/utils/results.dart';

abstract class Adapter {
  Future<Result<NetworkFailure, NetworkResponseModel<T>>>
      onResponse<T extends Entity>(
          Result<NetworkFailure, NetworkResponseModel<T>> response,
          RequestApi api,
          NetworkClient client);
}
