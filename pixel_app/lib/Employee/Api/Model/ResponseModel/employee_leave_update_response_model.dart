// To parse this JSON data, do
//
//     final EmployeeLeaveUpdateResponseModel = EmployeeLeaveUpdateResponseModelFromJson(jsonString);

import 'dart:convert';

EmployeeLeaveUpdateResponseModel EmployeeLeaveUpdateResponseModelFromJson(
        String str) =>
    EmployeeLeaveUpdateResponseModel.fromJson(json.decode(str));

String EmployeeLeaveUpdateResponseModelToJson(
        EmployeeLeaveUpdateResponseModel data) =>
    json.encode(data.toJson());

class EmployeeLeaveUpdateResponseModel {
  EmployeeLeaveUpdateResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  int? data;

  factory EmployeeLeaveUpdateResponseModel.fromJson(
          Map<String, dynamic> json) =>
      EmployeeLeaveUpdateResponseModel(
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
