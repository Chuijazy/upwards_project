import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage {
  static const _keyAccess = 'access';
  static const _keyRefresh = 'refresh';
  static const _keyFullName = 'full_name';
  static const _keyGroup = 'group';

  // Сохраняем токены и данные пользователя
  static Future<void> saveUserData({
    required String accessToken,
    required String refreshToken,
    required String fullName,
    required String group,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAccess, accessToken);
    await prefs.setString(_keyRefresh, refreshToken);
    await prefs.setString(_keyFullName, fullName);
    await prefs.setString(_keyGroup, group);
  }

  // Получаем токены и данные
  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyAccess);
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyRefresh);
  }

  static Future<String?> getFullName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyFullName);
  }

  static Future<String?> getGroup() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyGroup);
  }

  // Очищаем все данные пользователя
  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyAccess);
    await prefs.remove(_keyRefresh);
    await prefs.remove(_keyFullName);
    await prefs.remove(_keyGroup);
  }
}
