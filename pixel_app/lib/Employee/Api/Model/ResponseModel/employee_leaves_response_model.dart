// To parse this JSON data, do
//
//     final employeeLeavesResponseModel = employeeLeavesResponseModelFromJson(jsonString);

import 'dart:convert';

EmployeeLeavesResponseModel employeeLeavesResponseModelFromJson(String str) =>
    EmployeeLeavesResponseModel.fromJson(json.decode(str));

String employeeLeavesResponseModelToJson(EmployeeLeavesResponseModel data) =>
    json.encode(data.toJson());

class EmployeeLeavesResponseModel {
  EmployeeLeavesResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  Data? data;

  factory EmployeeLeavesResponseModel.fromJson(Map<String, dynamic> json) =>
      EmployeeLeavesResponseModel(
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
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
  });

  int? draw;
  int? recordsTotal;
  int? recordsFiltered;
  List<LeaveDataList>? data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        draw: json["draw"],
        recordsTotal: json["recordsTotal"],
        recordsFiltered: json["recordsFiltered"],
        data: List<LeaveDataList>.from(
            json["data"].map((x) => LeaveDataList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "draw": draw,
        "recordsTotal": recordsTotal,
        "recordsFiltered": recordsFiltered,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class LeaveDataList {
  LeaveDataList({
    this.leaveId,
    this.leaveNm,
    this.leaveDt,
    this.leaveTypeId,
    this.leaveTypeNm,
    this.durationId,
    this.durationNm,
    this.leaveStatus,
  });

  int? leaveId;
  String? leaveNm;
  DateTime? leaveDt;
  int? leaveTypeId;
  String? leaveTypeNm;
  int? durationId;
  String? durationNm;
  String? leaveStatus;

  factory LeaveDataList.fromJson(Map<String, dynamic> json) => LeaveDataList(
        leaveId: json["LeaveId"],
        leaveNm: json["LeaveNm"],
        leaveDt: DateTime.parse(json["LeaveDt"]),
        leaveTypeId: json["LeaveTypeId"],
        leaveTypeNm: json["LeaveTypeNm"],
        durationId: json["DurationId"],
        durationNm: json["DurationNm"],
        leaveStatus: json["LeaveStatus"],
      );

  Map<String, dynamic> toJson() => {
        "LeaveId": leaveId,
        "LeaveNm": leaveNm,
        "LeaveDt": leaveDt!.toIso8601String(),
        "LeaveTypeId": leaveTypeId,
        "LeaveTypeNm": leaveTypeNm,
        "DurationId": durationId,
        "DurationNm": durationNm,
        "LeaveStatus": leaveStatus,
      };
}
