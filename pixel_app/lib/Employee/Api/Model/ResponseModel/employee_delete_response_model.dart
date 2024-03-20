// To parse this JSON data, do
//
//     final employeeDeleteResponseModel = employeeDeleteResponseModelFromJson(jsonString);

import 'dart:convert';

EmployeeDeleteResponseModel employeeDeleteResponseModelFromJson(String str) =>
    EmployeeDeleteResponseModel.fromJson(json.decode(str));

String employeeDeleteResponseModelToJson(EmployeeDeleteResponseModel data) =>
    json.encode(data.toJson());

class EmployeeDeleteResponseModel {
  EmployeeDeleteResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  int? data;

  factory EmployeeDeleteResponseModel.fromJson(Map<String, dynamic> json) =>
      EmployeeDeleteResponseModel(
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
