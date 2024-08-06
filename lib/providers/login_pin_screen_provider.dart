import 'package:cash_collection/common/app_array.dart';
import 'package:flutter/material.dart';

class LoginPinScreenProvider with ChangeNotifier {
  String _otp = '';
  String _otpError = '';
  int _incorrectAttempts = 0;

  String get otp => _otp;
  String get otpError => _otpError;
  int get incorrectAttempts => _incorrectAttempts;

  void setOtp(String otp) {
    _otp = otp;
    notifyListeners();
  }

  bool validateOtp() {
    if (_otp.length != 5) {
      _otpError = 'OTP must be 5 digits';
      notifyListeners();
      return false;
    }
    _otpError = '';
    notifyListeners();
    return true;
  }

  bool checkOtp() {
    if (_otp == AppArray().userPin.toString()) {
      _otpError = '';
      notifyListeners();
      return true;
    } else {
      _incorrectAttempts++;
      _otpError = 'Invalid PIN';
      if (_incorrectAttempts >= 4 && _incorrectAttempts < 5) {
        _otpError += '\nYou have ${5 - _incorrectAttempts} more attempt(s).';
      }
      notifyListeners();
      return false;
    }
  }

  bool submitOtp() {
    if (validateOtp()) {
      if (checkOtp()) {
        print('OTP submitted: $_otp');
        _incorrectAttempts = 0; // Reset attempts on successful login
        return true;
      } else {
        if (_incorrectAttempts >= 5) {
          print('Too many incorrect attempts');
        }
        return false;
      }
    }
    return false;
  }

  void clearOtp() {
    _otp = '';
    _otpError = '';
    notifyListeners();
  }
}
