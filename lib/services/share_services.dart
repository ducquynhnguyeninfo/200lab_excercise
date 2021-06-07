import 'package:shared_preferences/shared_preferences.dart';

class ShareService {
  static final ShareService _instance = ShareService._internal();

  late SharedPreferences _preferences;

  factory ShareService() {
    return _instance;
  }

  Future<ShareService> getInstance() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString({required String key, required String value}) async {
    return await _preferences.setString(key, value);
  }

  String getString(String key) {
    String? value = _preferences.getString(key);
    return value ?? "";
  }

  ShareService._internal();
}
