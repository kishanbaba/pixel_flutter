// To parse this JSON data, do
//
//     final employeeCheckInCheckOutResponseModel = employeeCheckInCheckOutResponseModelFromJson(jsonString);

import 'dart:convert';

EmployeeCheckInCheckOutResponseModel
    employeeCheckInCheckOutResponseModelFromJson(String str) =>
        EmployeeCheckInCheckOutResponseModel.fromJson(json.decode(str));

String employeeCheckInCheckOutResponseModelToJson(
        EmployeeCheckInCheckOutResponseModel data) =>
    json.encode(data.toJson());

class EmployeeCheckInCheckOutResponseModel {
  EmployeeCheckInCheckOutResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  Data? data;

  factory EmployeeCheckInCheckOutResponseModel.fromJson(
          Map<String, dynamic> json) =>
      EmployeeCheckInCheckOutResponseModel(
        statusCode: json["StatusCode"],
        status: json["Status"],
        message: json["Message"],
        data: Data.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "Status": status,
        "Message": message,
        "Data": data!.toJson(),
      };
}

class Data {
  Data({
    this.srNo,
    this.attendId,
    this.adminId,
    this.checkIn,
    this.checkOut,
    this.checkInOut,
    this.creDt,
    this.modDt,
    this.ipAdd,
    this.isExists,
  });

  int? srNo;
  int? attendId;
  int? adminId;
  DateTime? checkIn;
  DateTime? checkOut;
  DateTime? checkInOut;
  DateTime? creDt;
  DateTime? modDt;
  String? ipAdd;
  bool? isExists;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        srNo: json["SrNo"],
        attendId: json["AttendId"],
        adminId: json["AdminId"],
        checkIn: DateTime.parse(json["CheckIn"]),
        checkOut: DateTime.parse(json["CheckOut"]),
        checkInOut: DateTime.parse(json["CheckInOut"]),
        creDt: DateTime.parse(json["CreDt"]),
        modDt: DateTime.parse(json["ModDt"]),
        ipAdd: json["IpAdd"],
        isExists: json["IsExists"],
      );

  Map<String, dynamic> toJson() => {
        "SrNo": srNo,
        "AttendId": attendId,
        "AdminId": adminId,
        "CheckIn": checkIn!.toIso8601String(),
        "CheckOut": checkOut!.toIso8601String(),
        "CheckInOut": checkInOut!.toIso8601String(),
        "CreDt": creDt!.toIso8601String(),
        "ModDt": modDt!.toIso8601String(),
        "IpAdd": ipAdd,
        "IsExists": isExists,
      };
}
