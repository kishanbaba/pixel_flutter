// To parse this JSON data, do
//
//     final employeeLeaveDeleteResponseModel = employeeLeaveDeleteResponseModelFromJson(jsonString);

import 'dart:convert';

EmployeeLeaveDeleteResponseModel employeeLeaveDeleteResponseModelFromJson(
        String str) =>
    EmployeeLeaveDeleteResponseModel.fromJson(json.decode(str));

String employeeLeaveDeleteResponseModelToJson(
        EmployeeLeaveDeleteResponseModel data) =>
    json.encode(data.toJson());

class EmployeeLeaveDeleteResponseModel {
  EmployeeLeaveDeleteResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  int? data;

  factory EmployeeLeaveDeleteResponseModel.fromJson(
          Map<String, dynamic> json) =>
      EmployeeLeaveDeleteResponseModel(
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
