import 'package:flutter/material.dart';

class ForgotPasswordScreenProvider with ChangeNotifier {
  String _email = '';
  String _emailError = '';
  String _otp = '';
  String _otpError = '';
  String _newPassword = '';
  String _confirmPassword = '';
  String _passwordError = '';
  String _confirmPasswordError = '';

  String get email => _email;
  String get emailError => _emailError;
  String get otp => _otp;
  String get otpError => _otpError;
  String get newPassword => _newPassword;
  String get confirmPassword => _confirmPassword;
  String get passwordError => _passwordError;
  String get confirmPasswordError => _confirmPasswordError;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setOtp(String value) {
    _otp = value;
    notifyListeners();
  }

  void setNewPassword(String value) {
    _newPassword = value;
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  bool validateEmail() {
    if (_email.isEmpty) {
      _emailError = 'Email cannot be empty';
      notifyListeners();
      return false;
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(_email)) {
      _emailError = 'Invalid email address';
      notifyListeners();
      return false;
    }
    _emailError = '';
    notifyListeners();
    return true;
  }

  bool validateOtp() {
    if (_otp.isEmpty) {
      _otpError = 'OTP cannot be empty';
      notifyListeners();
      return false;
    } else if (_otp.length != 4) {
      _otpError = 'OTP must be 4 digits';
      notifyListeners();
      return false;
    }
    _otpError = '';
    notifyListeners();
    return true;
  }

  bool validatePassword() {
    if (_newPassword.isEmpty) {
      _passwordError = 'Password cannot be empty';
      notifyListeners();
      return false;
    } else if (_newPassword.length < 8) {
      _passwordError = 'Password must be at least 8 characters';
      notifyListeners();
      return false;
    } else if (_newPassword.contains(' ')) {
      _passwordError = 'Password cannot contain spaces';
      notifyListeners();
      return false;
    } else if (!RegExp(r'[0-9]').hasMatch(_newPassword)) {
      _passwordError = 'Password must contain at least one number';
      notifyListeners();
      return false;
    } else if (!RegExp(r'[a-z]').hasMatch(_newPassword)) {
      _passwordError = 'Password must contain at least one lowercase letter';
      notifyListeners();
      return false;
    } else if (!RegExp(r'[A-Z]').hasMatch(_newPassword)) {
      _passwordError = 'Password must contain at least one uppercase letter';
      notifyListeners();
      return false;
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(_newPassword)) {
      _passwordError = 'Password must contain at least one symbol';
      notifyListeners();
      return false;
    }
    _passwordError = '';
    notifyListeners();
    return true;
  }

  bool validateConfirmPassword() {
    if (_confirmPassword.isEmpty) {
      _confirmPasswordError = 'Confirm password cannot be empty';
      notifyListeners();
      return false;
    } else if (_confirmPassword != _newPassword) {
      _confirmPasswordError = 'Passwords do not match';
      notifyListeners();
      return false;
    }
    _confirmPasswordError = '';
    notifyListeners();
    return true;
  }

  void submitEmail() {
    if (validateEmail()) {
      print('Email: $_email'); // Print the email
    }
  }

  bool submitOtp() {
    bool isOtpCorrect = false;
    if (validateOtp()) {
      print('OTP: $_otp'); // Print the OTP
      // Check using API call
      // If API response is correct
      isOtpCorrect = true;
    } else {
      print('OTP validation failed');
    }
    return isOtpCorrect;
  }

  void submitNewPassword() {
    if (validatePassword() && validateConfirmPassword()) {
      print('New Password: $_newPassword'); // Print the new password
      // Implement with password reset logic
    }
  }
}
