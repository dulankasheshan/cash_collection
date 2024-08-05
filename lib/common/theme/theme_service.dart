import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config.dart';
import 'app_theme.dart';

class ThemeService extends ChangeNotifier {
  final SharedPreferences sharedPreferences;

  ThemeService(this.sharedPreferences);

  bool get isDarkMode => sharedPreferences.getBool(session.isDarkMode) ?? false;
  ThemeMode get theme => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    sharedPreferences.setBool(session.isDarkMode, !isDarkMode);
    notifyListeners();
  }

  AppTheme get appTheme =>
      isDarkMode ? AppTheme.fromType(ThemeType.dark) : AppTheme.fromType(ThemeType.light);
}
