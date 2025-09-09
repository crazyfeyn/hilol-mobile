import 'package:commerce_mobile/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DBService {
  static late final SharedPreferences _instance;

  static Future<void> ensureInitialized() async {
    _instance = await SharedPreferences.getInstance();
  }

  static bool isLoggedIn() {
    String token = getAccessToken();
    return token.isNotEmpty;
  }

  static Future<bool> logOut() async {
    var language = getLanguage();

    final res = await _instance.clear(); // Clear all data on database DB

    // in order save language after logout
    if (language != null) setLanguage(language);
    return res;
  }

  /// Language set [uz-UZ]
  static String? getLanguage() {
    var lang = _instance.getString(_StorageKeys.language);
    return lang;
  }

  /// Language get [uz-UZ]
  static Future<bool> setLanguage(String code) async {
    return await _instance.setString(_StorageKeys.language, code);
  }

  /// Access Token
  static Future<bool> setAccessToken(String? value) async {
    if (value == null) return false;
    return await _instance.setString(_StorageKeys.accessToken, value);
  }

  // Add saveAccessToken method (alias for setAccessToken for compatibility)
  static Future<bool> saveAccessToken(String? value) async {
    return await setAccessToken(value);
  }

  static String getAccessToken() {
    return _instance.getString(_StorageKeys.accessToken) ?? '';
  }

  static Future<bool> delAccessToken() async {
    return await _instance.remove(_StorageKeys.accessToken);
  }

  /// Refresh Token - NEW METHODS
  static Future<bool> setRefreshToken(String? value) async {
    if (value == null) return false;
    return await _instance.setString(_StorageKeys.refreshToken, value);
  }

  // Add saveRefreshToken method (alias for setRefreshToken for compatibility)
  static Future<bool> saveRefreshToken(String? value) async {
    return await setRefreshToken(value);
  }

  static String getRefreshToken() {
    return _instance.getString(_StorageKeys.refreshToken) ?? '';
  }

  static Future<bool> delRefreshToken() async {
    return await _instance.remove(_StorageKeys.refreshToken);
  }

  /// Clear all tokens - NEW METHOD
  static Future<bool> clearTokens() async {
    bool accessCleared = await delAccessToken();
    bool refreshCleared = await delRefreshToken();
    return accessCleared && refreshCleared;
  }

  /// Client ID - NEW METHODS (if needed for refresh token API)
  static Future<bool> setClientId(String? value) async {
    if (value == null) return false;
    return await _instance.setString(_StorageKeys.clientId, value);
  }

  static String getClientId() {
    return _instance.getString(_StorageKeys.clientId) ?? '';
  }

  static Future<bool> delClientId() async {
    return await _instance.remove(_StorageKeys.clientId);
  }

  /// User Data
  static Future<bool> setUserData(UserModel value) async {
    return await _instance.setString(
      _StorageKeys.userData,
      userModelToJson(value),
    );
  }

  static UserModel? getUserData() {
    final value = _instance.getString(_StorageKeys.userData);
    return value != null ? userModelFromJson(value) : null;
  }

  static Future<bool> delUserData() async {
    return await _instance.remove(_StorageKeys.userData);
  }
}

class _StorageKeys {
  static const language = 'language';
  static const accessToken = 'access_token';
  static const refreshToken = 'refresh_token';
  static const clientId = 'client_id';
  static const userData = 'user_data';
}
