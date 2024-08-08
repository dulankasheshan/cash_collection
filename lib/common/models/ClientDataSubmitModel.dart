
class ClientDataSubmitModel {
  final String paymentMethod;
  final String amount;
  final String? checkNumber;
  final String? checkDate;
  final String refId;
  final String clientId;
  final String? bankName;

ClientDataSubmitModel({
    required this.paymentMethod,
    required this.amount,
    this.checkNumber,
    this.checkDate,
    required this.refId,
    required this.clientId,
    this.bankName,
  });


  // factory ClientDataModel.fromJson(Map<String, dynamic> json) => _$ClientDataModelFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$ClientDataModelToJson(this);
}
