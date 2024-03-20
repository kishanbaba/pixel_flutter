// To parse this JSON data, do
//
//     final employeeLoginResponseModel = employeeLoginResponseModelFromJson(jsonString);

import 'dart:convert';

EmployeeLoginResponseModel employeeLoginResponseModelFromJson(String str) =>
    EmployeeLoginResponseModel.fromJson(json.decode(str));

String employeeLoginResponseModelToJson(EmployeeLoginResponseModel data) =>
    json.encode(data.toJson());

class EmployeeLoginResponseModel {
  EmployeeLoginResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  List<Datum>? data;

  factory EmployeeLoginResponseModel.fromJson(Map<String, dynamic> json) =>
      EmployeeLoginResponseModel(
        statusCode: json["StatusCode"],
        status: json["Status"],
        message: json["Message"],
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "Status": status,
        "Message": message,
        "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.employeeId,
    this.loginNm,
    this.emailId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.roleId,
    this.imgPath,
    this.isMain,
  });

  int? employeeId;
  String? loginNm;
  String? emailId;
  String? firstName;
  dynamic middleName;
  dynamic lastName;
  int? roleId;
  dynamic imgPath;
  bool? isMain;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        employeeId: json["EmployeeID"],
        loginNm: json["LoginNm"],
        emailId: json["EmailId"],
        firstName: json["FirstName"],
        middleName: json["MiddleName"],
        lastName: json["LastName"],
        roleId: json["RoleId"],
        imgPath: json["ImgPath"],
        isMain: json["IsMain"],
      );

  Map<String, dynamic> toJson() => {
        "EmployeeID": employeeId,
        "LoginNm": loginNm,
        "EmailId": emailId,
        "FirstName": firstName,
        "MiddleName": middleName,
        "LastName": lastName,
        "RoleId": roleId,
        "ImgPath": imgPath,
        "IsMain": isMain,
      };
}
