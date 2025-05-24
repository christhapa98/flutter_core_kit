abstract class StorageBase {
  Future<String?> read(String key);
  Future<Map<String, String>> readAll();
  Future<bool> write(String key, String value);
  Future<bool> writeBool(String key, bool value);
  Future<bool> readBool(String key);
  Future<bool> delete(String key);
  Future<void> deleteAll();
  Future<bool> containsKey(String key);
  Future<void> setObject(Map<String, dynamic> object, String key);
  Future<Map<String, dynamic>?> getObject(String key);
}
