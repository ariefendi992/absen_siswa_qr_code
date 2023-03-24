import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomStorage {
  final storage = const FlutterSecureStorage();

  Future setStorage(String key, value) async {
    await storage.write(key: key, value: value);
  }

  Future getStorage(String key) async {
    final getKey = await storage.read(key: key);
    return getKey;
  }

  Future deleteKey(String key) async {
    await storage.delete(key: key);
  }

  Future deleteAllKey() async {
    await storage.deleteAll();
  }
}
