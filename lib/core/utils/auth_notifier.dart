import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthNotifier extends ChangeNotifier {
  bool _loggedIn = false;
  bool get isLoggedIn => _loggedIn;

  String? _token;
  String? get token => _token;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final storedToken = prefs.getString('auth_token');
    _token = storedToken;
    _loggedIn = storedToken != null && storedToken.isNotEmpty;
    notifyListeners();
  }

  Future<void> login(String authToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', authToken);
    await prefs.setString('refresh_token', refreshToken);

    _token = authToken;
    _loggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('refresh_token');

    _token = null;
    _loggedIn = false;
    notifyListeners();
  }
}
