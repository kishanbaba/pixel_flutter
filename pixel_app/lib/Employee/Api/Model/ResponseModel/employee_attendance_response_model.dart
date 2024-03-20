// To parse this JSON data, do
//
//     final employeeAttendanceResponseModel = employeeAttendanceResponseModelFromJson(jsonString);

import 'dart:convert';

EmployeeAttendanceResponseModel employeeAttendanceResponseModelFromJson(
        String str) =>
    EmployeeAttendanceResponseModel.fromJson(json.decode(str));

String employeeAttendanceResponseModelToJson(
        EmployeeAttendanceResponseModel data) =>
    json.encode(data.toJson());

class EmployeeAttendanceResponseModel {
  EmployeeAttendanceResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  List<Attendance>? data;

  factory EmployeeAttendanceResponseModel.fromJson(Map<String, dynamic> json) =>
      EmployeeAttendanceResponseModel(
        statusCode: json["StatusCode"],
        status: json["Status"],
        message: json["Message"],
        data: List<Attendance>.from(
            json["Data"].map((x) => Attendance.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "Status": status,
        "Message": message,
        "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Attendance {
  Attendance({
    this.checkIn,
    this.checkInDay,
    this.workHour,
    this.salary,
    this.attendanceDetails,
  });

  String? checkIn;
  String? checkInDay;
  String? workHour;
  String? salary;
  List<AttendanceDetail>? attendanceDetails;

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        checkIn: json["CheckIn"],
        checkInDay: json["CheckInDay"],
        workHour: json["WorkHour"],
        salary: json["Salary"],
        attendanceDetails: List<AttendanceDetail>.from(
            json["AttendanceDetails"].map((x) => AttendanceDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "CheckIn": checkIn,
        "CheckInDay": checkInDay,
        "WorkHour": workHour,
        "Salary": salary,
        "AttendanceDetails":
            List<dynamic>.from(attendanceDetails!.map((x) => x.toJson())),
      };
}

class AttendanceDetail {
  AttendanceDetail({
    this.checkIn,
    this.checkOut,
    this.workHour,
    this.date,
  });

  String? checkIn;
  String? checkOut;
  String? workHour;
  String? date;

  factory AttendanceDetail.fromJson(Map<String, dynamic> json) =>
      AttendanceDetail(
        checkIn: json["CheckIn"],
        checkOut: json["CheckOut"],
        workHour: json["WorkHour"],
        date: json["Date"],
      );

  Map<String, dynamic> toJson() => {
        "CheckIn": checkIn,
        "CheckOut": checkOut,
        "WorkHour": workHour,
        "Date": date,
      };
}
