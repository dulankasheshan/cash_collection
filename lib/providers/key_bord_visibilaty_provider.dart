import 'package:flutter/material.dart';

class KeyboardVisibilityProvider with ChangeNotifier {
  bool _isKeyboardVisible = false;

  bool get isKeyboardVisible => _isKeyboardVisible;

  void updateKeyboardVisibility(bool isVisible) {
    if (_isKeyboardVisible != isVisible) {
      _isKeyboardVisible = isVisible;
      notifyListeners();
    }
  }
}
