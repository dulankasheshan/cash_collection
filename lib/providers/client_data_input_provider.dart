import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../common/models/ClientDataSubmitModel.dart';

class ClientDataInputProvider extends ChangeNotifier {
  String? _paymentMethod;
  String? _amount;
  String? _checkNumber;
  String? _checkDate;
  String? _refId;
  String? _clientId;
  String? _bankName;
  String? _imagePath;
  bool _isSubmitted = false;

  void setPaymentMethod(String method) {
    _paymentMethod = method;
    notifyListeners();
  }

  void setAmount(String value) {
    _amount = value;
    notifyListeners();
  }

  void setCheckNumber(String value) {
    _checkNumber = value;
    notifyListeners();
  }

  void setCheckDate(String value) {
    _checkDate = value;
    notifyListeners();
  }

  void setRefId(String refId) {
    _refId = refId;
    notifyListeners();
  }

  void setClientId(String clientId) {
    _clientId = clientId;
    notifyListeners();
  }

  void setBankName(String value) {
    _bankName = value;
    notifyListeners();
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      _imagePath = pickedFile.path;
      notifyListeners();
    }
  }

  String? get imagePath => _imagePath;

  bool get isSubmitted => _isSubmitted;

  ClientDataSubmitModel get clientData => ClientDataSubmitModel(
    paymentMethod: _paymentMethod ?? '',
    amount: _amount ?? '',
    checkNumber: _checkNumber,
    checkDate: _checkDate,
    refId: _refId ?? '',
    clientId: _clientId ?? '',
    bankName: _bankName,
  );

  bool submitData() {
    _isSubmitted = true;
    notifyListeners();

    // Ensure all required fields are filled
    if (_paymentMethod == null || _amount == null || _amount!.isEmpty) {
      print('Please provide all necessary details.');
      return false; // Keep the dialog open
    }

    // Ensure an image is selected only for Bank Transfer and Bank Cheque
    if ((_paymentMethod == 'Bank Cheque' || _paymentMethod == 'Bank Transfer') && _imagePath == null) {
      print('Please select an image.');
      _isSubmitted = false;
      notifyListeners();
      return false; // Keep the dialog open
    }

    print('Client ID: ${clientData.clientId}');
    print('Ref ID: ${clientData.refId}');

    switch (clientData.paymentMethod) {
      case 'Cash':
        print('Payment Method: ${clientData.paymentMethod}');
        print('Amount: ${clientData.amount}');
        break;
      case 'Bank Cheque':
        print('Payment Method: ${clientData.paymentMethod}');
        print('Cheque Number: ${clientData.checkNumber}');
        print('Cheque Realization Date: ${clientData.checkDate}');
        print('Amount: ${clientData.amount}');
        print('Bank Name: ${clientData.bankName}');
        break;
      case 'Bank Transfer':
        print('Payment Method: ${clientData.paymentMethod}');
        print('Amount: ${clientData.amount}');
        break;
      default:
        print('Unknown payment method');
    }

    if (_imagePath != null) {
      print('Image Path: $_imagePath');
    }

    // Clear all values after submission
    _paymentMethod = null;
    _amount = null;
    _checkNumber = null;
    _checkDate = null;
    _refId = null;
    _clientId = null;
    _bankName = null;
    _imagePath = null;
    _isSubmitted = false;
    notifyListeners();

    return true; // Allow the dialog to close
  }

  void clearImagePath() {
    _imagePath = null;
    notifyListeners();
  }
}
