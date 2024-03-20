// To parse this JSON data, do
//
//     final employeeLeavesMasterResponseModel = employeeLeavesMasterResponseModelFromJson(jsonString);

import 'dart:convert';

EmployeeLeavesMasterResponseModel employeeLeavesMasterResponseModelFromJson(
        String str) =>
    EmployeeLeavesMasterResponseModel.fromJson(json.decode(str));

String employeeLeavesMasterResponseModelToJson(
        EmployeeLeavesMasterResponseModel data) =>
    json.encode(data.toJson());

class EmployeeLeavesMasterResponseModel {
  EmployeeLeavesMasterResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  Data? data;

  factory EmployeeLeavesMasterResponseModel.fromJson(
          Map<String, dynamic> json) =>
      EmployeeLeavesMasterResponseModel(
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
    this.leaveType,
    this.duration,
  });

  List<LeaveType>? leaveType;
  List<Duration>? duration;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        leaveType: List<LeaveType>.from(
            json["LeaveType"].map((x) => LeaveType.fromJson(x))),
        duration: List<Duration>.from(
            json["Duration"].map((x) => Duration.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "LeaveType": List<dynamic>.from(leaveType!.map((x) => x.toJson())),
        "Duration": List<dynamic>.from(duration!.map((x) => x.toJson())),
      };
}

class Duration {
  Duration({
    this.durationId,
    this.durationNm,
  });

  int? durationId;
  String? durationNm;

  factory Duration.fromJson(Map<String, dynamic> json) => Duration(
        durationId: json["DurationId"],
        durationNm: json["DurationNm"],
      );

  Map<String, dynamic> toJson() => {
        "DurationId": durationId,
        "DurationNm": durationNm,
      };
}

class LeaveType {
  LeaveType({
    this.leaveTypeId,
    this.leaveTypeNm,
  });

  int? leaveTypeId;
  String? leaveTypeNm;

  factory LeaveType.fromJson(Map<String, dynamic> json) => LeaveType(
        leaveTypeId: json["LeaveTypeId"],
        leaveTypeNm: json["LeaveTypeNm"],
      );

  Map<String, dynamic> toJson() => {
        "LeaveTypeId": leaveTypeId,
        "LeaveTypeNm": leaveTypeNm,
      };
}
