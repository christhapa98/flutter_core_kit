abstract class BaseLocalStorage {
  Future<String?> read(String key);
  Future<Map<String, String>> readAll();
  Future<void> write(String key, String value);
  Future<void> delete(String key);
  Future<void> deleteAll();
  Future<bool> containsKey(String key);
  Future<void> setObject(Map<String, dynamic> object, String key);
  Future<Map<String, dynamic>?> getObject(String key);
}
