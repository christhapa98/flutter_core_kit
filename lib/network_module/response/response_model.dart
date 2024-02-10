import 'package:flutter_core_kit/entity/entity.dart';
import 'package:flutter_core_kit/network_module/request/request_api.dart';

class NetworkResponseModel<T extends Entity> {
  final RequestApi api;
  final int statusCode;
  final String message;
  final Map<String, dynamic> rawObject;
  T? object;

  NetworkResponseModel(
      {required this.api,
      required this.statusCode,
      required this.message,
      required this.rawObject,
      this.object});
}
