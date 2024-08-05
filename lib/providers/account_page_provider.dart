import 'package:flutter/foundation.dart';

class AccountPageProvider with ChangeNotifier {
  bool _isUpdated = false;

  bool get isUpdated => _isUpdated;

  void setUpdated(bool value) {
    _isUpdated = value;
    notifyListeners();
  }
}
