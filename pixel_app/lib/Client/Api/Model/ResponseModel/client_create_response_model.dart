// To parse this JSON data, do
//
//     final clientCreateResponseModel = clientCreateResponseModelFromJson(jsonString);

import 'dart:convert';

ClientCreateResponseModel clientCreateResponseModelFromJson(String str) =>
    ClientCreateResponseModel.fromJson(json.decode(str));

String clientCreateResponseModelToJson(ClientCreateResponseModel data) =>
    json.encode(data.toJson());

class ClientCreateResponseModel {
  ClientCreateResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  int? data;

  factory ClientCreateResponseModel.fromJson(Map<String, dynamic> json) =>
      ClientCreateResponseModel(
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
