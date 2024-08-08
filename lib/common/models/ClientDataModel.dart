class ClientDataModel {
  final String clientId;
  final String clientName;
  final String clientAddress;
  final String clientImage;

  ClientDataModel({
    required this.clientId,
    required this.clientName,
    required this.clientAddress,
    required this.clientImage,
  });

  // Factory constructor to create an instance from JSON
  factory ClientDataModel.fromJson(Map<String, dynamic> json) {
    return ClientDataModel(
      clientId: json['clientId'],
      clientName: json['clientName'],
      clientAddress: json['clientAddress'],
      clientImage: json['clientImage'],
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'clientId': clientId,
      'clientName': clientName,
      'clientAddress': clientAddress,
      'clientImage': clientImage,
    };
  }
}
