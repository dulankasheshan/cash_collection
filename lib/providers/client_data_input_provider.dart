import 'package:flutter/material.dart';
import '../common/models/ClientDataModel.dart';

class ClientDataInputProvider extends ChangeNotifier {
  String? _paymentMethod;
  String? _amount;
  String? _checkNumber;
  String? _checkDate;
  String? _refId;
  String? _clientId;
  String? _bankName;

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

  ClientDataModel get clientData => ClientDataModel(
    paymentMethod: _paymentMethod ?? '',
    amount: _amount ?? '',
    checkNumber: _checkNumber,
    checkDate: _checkDate,
    refId: _refId ?? '',
    clientId: _clientId ?? '',
    bankName: _bankName,
  );

  void submitData() {
    print('Client ID: ${clientData.clientId}');
    print('Ref ID: ${clientData.refId}');

    switch (clientData.paymentMethod) {
      case 'Cash':
        print('Payment Method: ${clientData.paymentMethod}');
        print('Amount: ${clientData.amount}');
        break;
      case 'Bank Check':
        print('Payment Method: ${clientData.paymentMethod}');
        print('Check Number: ${clientData.checkNumber}');
        print('Check Realization Date: ${clientData.checkDate}');
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

    // Clear all values
    _paymentMethod = null;
    _amount = null;
    _checkNumber = null;
    _checkDate = null;
    _refId = null;
    _clientId = null;
    _bankName = null;
    notifyListeners();
  }
}
