import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_core_kit/local_storage/base_local_storage.dart';

class SecureLocalStorage implements BaseLocalStorage {
  final _storage = const FlutterSecureStorage();

  @override
  Future<bool> containsKey(String key) async {
    return _storage.containsKey(key: key);
  }

  @override
  Future<void> delete(String key) {
    return _storage.delete(key: key);
  }

  @override
  Future<void> deleteAll() {
    return _storage.deleteAll();
  }

  @override
  Future<String?> read(String key) {
    return _storage.read(key: key);
  }

  @override
  Future<Map<String, String>> readAll() {
    return _storage.readAll();
  }

  @override
  Future<void> write(String key, String value) {
    return _storage.write(key: key, value: value);
  }

  @override
  Future<void> setObject(Map<String, dynamic> object, String key) async {
    String json = jsonEncode(object);
    await _storage.write(key: key.toLowerCase(), value: json);
  }

  @override
  Future<Map<String, dynamic>?> getObject(String key) async {
    final str = await _storage.read(key: key.toLowerCase());
    if (str == null) {
      return null;
    }
    Map<String, dynamic> object = jsonDecode(str) as Map<String, dynamic>;
    return object;
  }
}
