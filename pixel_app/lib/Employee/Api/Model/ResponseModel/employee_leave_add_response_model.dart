// To parse this JSON data, do
//
//     final EmployeeLeaveAddResponseModel = EmployeeLeaveAddResponseModelFromJson(jsonString);

import 'dart:convert';

EmployeeLeaveAddResponseModel EmployeeLeaveAddResponseModelFromJson(
        String str) =>
    EmployeeLeaveAddResponseModel.fromJson(json.decode(str));

String EmployeeLeaveAddResponseModelToJson(
        EmployeeLeaveAddResponseModel data) =>
    json.encode(data.toJson());

class EmployeeLeaveAddResponseModel {
  EmployeeLeaveAddResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  int? data;

  factory EmployeeLeaveAddResponseModel.fromJson(Map<String, dynamic> json) =>
      EmployeeLeaveAddResponseModel(
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
