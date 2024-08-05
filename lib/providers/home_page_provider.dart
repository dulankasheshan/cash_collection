import 'package:flutter/material.dart';
import '../common/app_array.dart';

class HomePageProvider with ChangeNotifier {
  // final AppArray _appArray = AppArray();

  String _dailyCollectAmount = AppArray().dailyCollectAmount;
  List<Map<String, String>> _collectedUsers = AppArray().collectedUsers;

  String get dailyCollectAmount => _dailyCollectAmount;
  List<Map<String, String>> get collectedUsers => _collectedUsers;

  void setDailyCollectAmount(String amount) {
    _dailyCollectAmount = amount.isEmpty ? '0.00' : amount;
    notifyListeners();
  }

  void updateCollectedUsers(List<Map<String, String>> users) {
    _collectedUsers = users;
    notifyListeners();
  }
}
