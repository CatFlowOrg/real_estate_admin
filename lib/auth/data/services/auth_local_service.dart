import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalService {
  static const _authTokenKey = 'auth_token';
  static const _refreshTokenKey = 'refresh_token';

  Future<void> saveTokens({
    required String authToken,
    required String refreshToken,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_authTokenKey, authToken);
    await prefs.setString(_refreshTokenKey, refreshToken);
  }

  Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_authTokenKey);
  }

  Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authTokenKey);
    await prefs.remove(_refreshTokenKey);
  }
}
