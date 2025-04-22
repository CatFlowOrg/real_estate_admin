import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  static const _localeKey = 'selected_locale';

  LocaleCubit() : super(const Locale('en')) {
    _loadLocale();
  }

  void changeLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
    emit(locale);
  }

  void _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_localeKey) ?? 'en';
    emit(Locale(code));
  }
}
