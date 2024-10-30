import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SPKeys { darkMode }

class PreferencesService {
  static late SharedPreferences _prefs;

  static Future<void> initialize() async => _prefs = await SharedPreferences.getInstance();
  void clear() => _prefs.clear();

  bool getDarkTheme() {
    bool? isDarkMode = _prefs.getBool(SPKeys.darkMode.name);
    if (isDarkMode == null) {
      var brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      if (brightness == Brightness.dark) {
        isDarkMode = true;
      }
    }
    return isDarkMode ?? false;
  }

  Future<void> setDarkTheme(bool value) async {
    await _prefs.setBool(SPKeys.darkMode.name, value);
  }
}
