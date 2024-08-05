import 'package:flutter/material.dart';

class LoginScreenProvider with ChangeNotifier {
  String _email = '';
  String _password = '';
  String _emailError = '';
  String _passwordError = '';

  String get email => _email;
  String get password => _password;
  String get emailError => _emailError;
  String get passwordError => _passwordError;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  bool validateEmail(String email) {
    if (email.isEmpty) {
      _emailError = 'Email cannot be empty';
      return false;
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      _emailError = 'Invalid email address';
      return false;
    }
    _emailError = '';
    return true;
  }

  bool validatePassword(String password) {
    if (password.isEmpty) {
      _passwordError = 'Password cannot be empty';
      return false;
    }
    _passwordError = '';
    return true;
  }

  void login() {
    bool isEmailValid = validateEmail(_email);
    bool isPasswordValid = validatePassword(_password);

    if (isEmailValid && isPasswordValid) {
      // Perform login action  - e.g., API request
      print('Email: $_email');
      print('Password: $_password');
      print('Login successful');
    } else {
      notifyListeners();
    }
  }
}
