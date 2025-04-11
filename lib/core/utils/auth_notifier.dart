import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthNotifier extends ChangeNotifier {
  bool _loggedIn = false;
  bool get isLoggedIn => _loggedIn;

  String? _authToken;
  String? get authToken => _authToken;

  String? _refreshToken;
  String? get refreshToken => _refreshToken;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final savedAuthToken = prefs.getString('auth_token');
    final savedRefreshToken = prefs.getString('refresh_token');

    _authToken = savedAuthToken;
    _refreshToken = savedRefreshToken;
    _loggedIn = (savedAuthToken != null && savedAuthToken.isNotEmpty);

    notifyListeners();
  }

  Future<void> login(String authToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', authToken);
    await prefs.setString('refresh_token', refreshToken);

    _authToken = authToken;
    _refreshToken = refreshToken;
    _loggedIn = true;

    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('refresh_token');

    _authToken = null;
    _refreshToken = null;
    _loggedIn = false;

    notifyListeners();
  }
}
