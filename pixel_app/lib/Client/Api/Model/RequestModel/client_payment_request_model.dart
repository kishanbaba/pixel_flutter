class ClientPaymentRequestModel {
  int? clientId;
  String? date;

  ClientPaymentRequestModel({this.clientId, this.date});

  ClientPaymentRequestModel.fromJson(Map<String, dynamic> json) {
    clientId = json['ClientId'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ClientId'] = this.clientId;
    data['Date'] = this.date;
    return data;
  }
}
