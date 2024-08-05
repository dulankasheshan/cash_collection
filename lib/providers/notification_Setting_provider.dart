import 'package:cash_collection/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationSettingsProvider with ChangeNotifier {
  bool _pushNotification = true;
  bool _emailNotification = true;
  bool _smsNotification = true;
  bool _newsletter = true;

  bool get pushNotification => _pushNotification;
  bool get emailNotification => _emailNotification;
  bool get smsNotification => _smsNotification;
  bool get newsletter => _newsletter;

  NotificationSettingsProvider() {
    _loadSettings();
  }

  _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _pushNotification = prefs.getBool(session.pushNotification) ?? true;
    _emailNotification = prefs.getBool(session.emailNotification) ?? true;
    _smsNotification = prefs.getBool(session.smsNotification) ?? true;
    _newsletter = prefs.getBool(session.newsletter) ?? true;
    notifyListeners();
  }

  _saveSettings(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  set pushNotification(bool value) {
    _pushNotification = value;
    _saveSettings(session.pushNotification, value);
    notifyListeners();
  }

  set emailNotification(bool value) {
    _emailNotification = value;
    _saveSettings(session.emailNotification, value);
    notifyListeners();
  }

  set smsNotification(bool value) {
    _smsNotification = value;
    _saveSettings(session.smsNotification, value);
    notifyListeners();
  }

  set newsletter(bool value) {
    _newsletter = value;
    _saveSettings(session.newsletter, value);
    notifyListeners();
  }
}
