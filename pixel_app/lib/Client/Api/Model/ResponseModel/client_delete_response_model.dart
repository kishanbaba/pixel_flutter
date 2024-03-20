// To parse this JSON data, do
//
//     final clientDeleteResponseModel = clientDeleteResponseModelFromJson(jsonString);

import 'dart:convert';

ClientDeleteResponseModel clientDeleteResponseModelFromJson(String str) =>
    ClientDeleteResponseModel.fromJson(json.decode(str));

String clientDeleteResponseModelToJson(ClientDeleteResponseModel data) =>
    json.encode(data.toJson());

class ClientDeleteResponseModel {
  ClientDeleteResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  int? data;

  factory ClientDeleteResponseModel.fromJson(Map<String, dynamic> json) =>
      ClientDeleteResponseModel(
        statusCode: json["StatusCode"],
        status: json["Status"],
        message: json["Message"],
        data: json["Data"],
      );

  Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "Status": status,
        "Message": message,
        "Data": data,
      };
}
