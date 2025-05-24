import 'dart:convert';

import 'package:flutter_core_kit/storage/storage.base.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceStorage extends StorageBase {
  SharedPreferences? _prefs;

  Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  @override
  Future<bool> containsKey(String key) async {
    await _initPrefs();
    return _prefs!.containsKey(key);
  }

  @override
  Future<bool> delete(String key) async {
    await _initPrefs();
    return _prefs!.remove(key);
  }

  @override
  Future<void> deleteAll() async {
    await _initPrefs();
    await _prefs!.clear();
  }

  @override
  Future<Map<String, dynamic>?> getObject(String key) async {
    await _initPrefs();
    final jsonString = _prefs!.getString(key);
    if (jsonString != null) {
      return json.decode(jsonString) as Map<String, dynamic>;
    }
    return null;
  }

  @override
  Future<String?> read(String key) async {
    await _initPrefs();
    return _prefs!.getString(key);
  }

  @override
  Future<Map<String, String>> readAll() async {
    await _initPrefs();
    return _prefs!.getKeys().fold<Map<String, String>>(
        {}, (map, key) => map..[key] = _prefs!.getString(key)!);
  }

  @override
  Future<void> setObject(Map<String, dynamic> object, String key) async {
    await _initPrefs();
    final jsonString = json.encode(object);
    await _prefs!.setString(key, jsonString);
  }

  @override
  Future<bool> write(String key, String value) async {
    await _initPrefs();
    return _prefs!.setString(key, value);
  }

  @override
  Future<bool> writeBool(String key, bool value) async {
    await _initPrefs();
    return _prefs!.setBool(key, value);
  }

  @override
  Future<bool> readBool(String key) async {
    await _initPrefs();
    return _prefs!.getBool(key) ?? false;
  }
}
