import 'package:flutter/material.dart';

class LoginPinScreenProvider with ChangeNotifier {
  String _otp = '';
  String _otpError = '';

  String get otp => _otp;
  String get otpError => _otpError;

  void setOtp(String otp) {
    _otp = otp;
    notifyListeners();
  }

  bool validateOtp() {
    // Add your OTP validation logic here
    if (_otp.length != 5) {
      _otpError = 'OTP must be 5 digits';
      notifyListeners();
      return false;
    }
    _otpError = '';
    notifyListeners();
    return true;
  }

  bool submitOtp() {
    if (validateOtp()) {
      // Add your OTP submission logic here
      return true;
    }
    return false;
  }

  void clearOtp() {
    _otp = '';
    _otpError = '';
    notifyListeners();
  }
}
