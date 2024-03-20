import 'dart:convert';

EmployeeStartEndProjectEventResponseModel
    employeeStartEndProjectEventResponseModelFromJson(String str) =>
        EmployeeStartEndProjectEventResponseModel.fromJson(json.decode(str));

String employeeStartEndProjectEventResponseModelToJson(
        EmployeeStartEndProjectEventResponseModel data) =>
    json.encode(data.toJson());

class EmployeeStartEndProjectEventResponseModel {
  EmployeeStartEndProjectEventResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  int? data;

  factory EmployeeStartEndProjectEventResponseModel.fromJson(
          Map<String, dynamic> json) =>
      EmployeeStartEndProjectEventResponseModel(
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
