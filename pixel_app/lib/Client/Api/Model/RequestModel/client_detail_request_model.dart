class ClientDetailRequestModel {
  int? clientId;

  ClientDetailRequestModel({this.clientId});

  ClientDetailRequestModel.fromJson(Map<String, dynamic> json) {
    clientId = json['ClientId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ClientId'] = this.clientId;
    return data;
  }
}
