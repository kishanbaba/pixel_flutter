// To parse this JSON data, do
//
//     final clientUpdateResponseModel = clientUpdateResponseModelFromJson(jsonString);

import 'dart:convert';

ClientUpdateResponseModel clientUpdateResponseModelFromJson(String str) =>
    ClientUpdateResponseModel.fromJson(json.decode(str));

String clientUpdateResponseModelToJson(ClientUpdateResponseModel data) =>
    json.encode(data.toJson());

class ClientUpdateResponseModel {
  ClientUpdateResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  int? data;

  factory ClientUpdateResponseModel.fromJson(Map<String, dynamic> json) =>
      ClientUpdateResponseModel(
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
