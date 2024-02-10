import 'package:flutter_core_kit/network_module/config/network_configuration.dart';
import 'package:flutter_core_kit/entity/entity.dart';
import 'package:flutter_core_kit/network_module/dio_client/client.dart';
import 'package:flutter_core_kit/network_module/network/http_method.dart';
import 'package:flutter_core_kit/network_module/network/network_failure.dart';
import 'package:flutter_core_kit/network_module/network/network_service.dart';
import 'package:flutter_core_kit/network_module/request/request_api.dart';
import 'package:flutter_core_kit/network_module/response/adapter.dart';
import 'package:flutter_core_kit/network_module/response/response_model.dart';
import 'package:flutter_core_kit/network_module/utils/results.dart';

abstract class BaseNetworkClient {
  final NetworkService service;
  final NetworkConfiguration config;
  Future<Result<NetworkFailure, NetworkResponseModel<T>>>
      request<T extends Entity>(RequestApi api);

  BaseNetworkClient({required this.service, required this.config});
}

class NetworkClient extends BaseNetworkClient {
  NetworkClient._({required super.config, required super.service});
  factory NetworkClient.fromConfig(NetworkConfiguration config) {
    final service = DIONetworkService(config: config);
    return NetworkClient._(config: config, service: service);
  }

  factory NetworkClient.fromService(NetworkService service) {
    return NetworkClient._(config: service.config, service: service);
  }

  @override
  Future<Result<NetworkFailure, NetworkResponseModel<T>>>
      request<T extends Entity>(RequestApi api) async {
    //Handle Interceptors
    var interceptors = config.interceptors;
    NetworkFailure? interceptorFailure;
    for (var interceptor in interceptors) {
      var interceptRequest = await interceptor.onRequest(api, this);
      interceptRequest.fold((l) {
        interceptorFailure = l;
        return Failure(l);
      }, (r) {
        api = r;
      });
      if (interceptRequest.hasError()) {
        break;
      }
    }
    if (interceptorFailure != null) {
      return Failure(interceptorFailure!);
    }

    //Ntwork Client Request
    Result<NetworkFailure, NetworkResponseModel<T>> response;
    switch (api.method) {
      case HTTPMethod.get:
        response = await service.get(api);
        break;
      case HTTPMethod.post:
        response = await service.post(api);
        break;
      case HTTPMethod.put:
        response = await service.put(api);
        break;
      case HTTPMethod.delete:
        response = await service.delete(api);
        break;
      case HTTPMethod.patch:
        response = await service.patch(api);
        break;
    }

    response = response.fold((l) => Failure(l), (r) {
      final res = NetworkResponseModel<T>(
          api: api,
          statusCode: r.statusCode,
          message: r.message,
          rawObject: r.rawObject,
          object: api.parser != null
              ? api.parser!.parseObject(r.rawObject) as T
              : null);
      return Success(res);
    });

    //Handle Adapters
    var adapters = config.adapters;
    for (Adapter adapter in adapters) {
      Result<NetworkFailure, NetworkResponseModel<T>> aResponse =
          await adapter.onResponse(
        response,
        api,
        this,
      );
      if (aResponse.hasError()) {
        return aResponse;
      }
      response = aResponse;
    }

    return response;
  }
}
