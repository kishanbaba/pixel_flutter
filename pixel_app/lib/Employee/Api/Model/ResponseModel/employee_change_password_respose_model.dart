// To parse this JSON data, do
//
//     final changePasswordResponseModel = changePasswordResponseModelFromJson(jsonString);

import 'dart:convert';

EmployeeChangePasswordResponseModel changePasswordResponseModelFromJson(
        String str) =>
    EmployeeChangePasswordResponseModel.fromJson(json.decode(str));

String changePasswordResponseModelToJson(
        EmployeeChangePasswordResponseModel data) =>
    json.encode(data.toJson());

class EmployeeChangePasswordResponseModel {
  EmployeeChangePasswordResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  int? data;

  factory EmployeeChangePasswordResponseModel.fromJson(
          Map<String, dynamic> json) =>
      EmployeeChangePasswordResponseModel(
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
