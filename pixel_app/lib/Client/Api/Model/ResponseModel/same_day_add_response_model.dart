// To parse this JSON data, do
//
//     final sameDayAddResponseModel = sameDayAddResponseModelFromJson(jsonString);

import 'dart:convert';

SameDayAddResponseModel sameDayAddResponseModelFromJson(String str) =>
    SameDayAddResponseModel.fromJson(json.decode(str));

String sameDayAddResponseModelToJson(SameDayAddResponseModel data) =>
    json.encode(data.toJson());

class SameDayAddResponseModel {
  SameDayAddResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  int? data;

  factory SameDayAddResponseModel.fromJson(Map<String, dynamic> json) =>
      SameDayAddResponseModel(
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
