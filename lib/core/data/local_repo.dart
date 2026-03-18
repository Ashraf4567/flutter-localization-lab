import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class LocalRepo {
  static const String _localeKey = 'locale';
  final SharedPreferences _sharedPreferences;

  LocalRepo({required SharedPreferences sharedPreferences}) : _sharedPreferences = sharedPreferences;

  Future<void> setLocaleCode(String localeCode) async {
    await _sharedPreferences.setString(_localeKey, localeCode);
  }

  Future<String?> getLocaleCode() async {
    final localeCode = _sharedPreferences.getString(_localeKey);
    if (localeCode == null) {
      return null;
    }
    return localeCode;
  }
}