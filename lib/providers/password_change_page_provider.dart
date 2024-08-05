import 'package:flutter/material.dart';

class PasswordChangePageProvider extends ChangeNotifier {
  String _currentPassword = '';
  String _newPassword = '';
  String _retypeNewPassword = '';

  String? _currentPasswordError;
  String? _newPasswordError;
  String? _retypeNewPasswordError;

  String get currentPassword => _currentPassword;
  String get newPassword => _newPassword;
  String get retypeNewPassword => _retypeNewPassword;

  String? get currentPasswordError => _currentPasswordError;
  String? get newPasswordError => _newPasswordError;
  String? get retypeNewPasswordError => _retypeNewPasswordError;

  void setCurrentPassword(String value) {
    _currentPassword = value;
    _validateCurrentPassword();
    notifyListeners();
  }

  void setNewPassword(String value) {
    _newPassword = value;
    _validateNewPassword();
    notifyListeners();
  }

  void setRetypeNewPassword(String value) {
    _retypeNewPassword = value;
    _validateRetypeNewPassword();
    notifyListeners();
  }

  bool _validateCurrentPassword() {
    if (_currentPassword.isEmpty) {
      _currentPasswordError = 'Current password cannot be empty';
      return false;
    }
    _currentPasswordError = null;
    return true;
  }

  bool _validateNewPassword() {
    if (_newPassword.isEmpty) {
      _newPasswordError = 'New password cannot be empty';
      return false;
    }
    if (_newPassword.length < 8) {
      _newPasswordError = 'New password must be at least 8 characters';
      return false;
    }
    if (!_newPassword.contains(RegExp(r'[A-Z]'))) {
      _newPasswordError = 'New password must contain at least one capital letter';
      return false;
    }
    if (!_newPassword.contains(RegExp(r'[0-9]'))) {
      _newPasswordError = 'New password must contain at least one number';
      return false;
    }
    if (!_newPassword.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      _newPasswordError = 'New password must contain at least one symbol';
      return false;
    }
    _newPasswordError = null;
    return true;
  }

  bool _validateRetypeNewPassword() {
    if (_retypeNewPassword.isEmpty) {
      _retypeNewPasswordError = 'Please retype new password';
      return false;
    }
    if (_retypeNewPassword != _newPassword) {
      _retypeNewPasswordError = 'Passwords do not match';
      return false;
    }
    _retypeNewPasswordError = null;
    return true;
  }

  bool validateForm() {
    bool isCurrentPasswordValid = _validateCurrentPassword();
    bool isNewPasswordValid = _validateNewPassword();
    bool isRetypeNewPasswordValid = _validateRetypeNewPassword();
    return isCurrentPasswordValid && isNewPasswordValid && isRetypeNewPasswordValid;
  }

  void submitForm() {
    // Force validate all fields
    _validateCurrentPassword();
    _validateNewPassword();
    _validateRetypeNewPassword();

    if (validateForm()) {
      print('Current Password: $_currentPassword');
      print('New Password: $_newPassword');
    } else {
      notifyListeners(); // Ensure UI reflects the updated errors
    }
  }

  void resetForm() {
    _currentPassword = '';
    _newPassword = '';
    _retypeNewPassword = '';
    _currentPasswordError = null;
    _newPasswordError = null;
    _retypeNewPasswordError = null;
    notifyListeners();
  }
}
