// To parse this JSON data, do
//
//     final employeeSalaryResponseModel = employeeSalaryResponseModelFromJson(jsonString);

import 'dart:convert';

EmployeeSalaryResponseModel employeeSalaryResponseModelFromJson(String str) =>
    EmployeeSalaryResponseModel.fromJson(json.decode(str));

String employeeSalaryResponseModelToJson(EmployeeSalaryResponseModel data) =>
    json.encode(data.toJson());

class EmployeeSalaryResponseModel {
  EmployeeSalaryResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  List<Salary>? data;

  factory EmployeeSalaryResponseModel.fromJson(Map<String, dynamic> json) =>
      EmployeeSalaryResponseModel(
        statusCode: json["StatusCode"],
        status: json["Status"],
        message: json["Message"],
        data: List<Salary>.from(json["Data"].map((x) => Salary.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "Status": status,
        "Message": message,
        "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Salary {
  Salary({
    this.date,
    this.pDay,
    this.workHour,
    this.salary,
  });

  DateTime? date;
  String? pDay;
  String? workHour;
  String? salary;

  factory Salary.fromJson(Map<String, dynamic> json) => Salary(
        date: DateTime.parse(json["Date"]),
        pDay: json["PDay"],
        workHour: json["WorkHour"],
        salary: json["Salary"],
      );

  Map<String, dynamic> toJson() => {
        "Date": date!.toIso8601String(),
        "PDay": pDay,
        "WorkHour": workHour,
        "Salary": salary,
      };
}
