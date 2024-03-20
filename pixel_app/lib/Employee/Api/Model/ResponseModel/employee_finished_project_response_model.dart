// To parse this JSON data, do
//
//     final employeePendingProjectResponseModel = employeePendingProjectResponseModelFromJson(jsonString);

import 'dart:convert';

EmployeeFinishedProjectResponseModel
    employeeFinishedProjectResponseModelFromJson(String str) =>
        EmployeeFinishedProjectResponseModel.fromJson(json.decode(str));

String employeeFinishedProjectResponseModelToJson(
        EmployeeFinishedProjectResponseModel data) =>
    json.encode(data.toJson());

class EmployeeFinishedProjectResponseModel {
  EmployeeFinishedProjectResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  Data? data;

  factory EmployeeFinishedProjectResponseModel.fromJson(
          Map<String, dynamic> json) =>
      EmployeeFinishedProjectResponseModel(
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
  List<Datum>? data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        draw: json["draw"],
        recordsTotal: json["recordsTotal"],
        recordsFiltered: json["recordsFiltered"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "draw": draw,
        "recordsTotal": recordsTotal,
        "recordsFiltered": recordsFiltered,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.projectId,
    this.projectDt,
    this.projectNm,
    this.clientCode,
    this.price,
    this.paidAmt,
    this.dueAmt,
    this.note,
    this.clientNote,
    this.isEventSong,
    this.isHilightSong,
    this.isRender,
    this.isUpload,
    this.currencySymbol,
    this.deliveryDt,
    this.projectStatus,
    this.projectEvents,
  });

  int? projectId;
  DateTime? projectDt;
  String? projectNm;
  String? clientCode;
  double? price;
  double? paidAmt;
  double? dueAmt;
  String? note;
  String? clientNote;
  bool? isEventSong;
  bool? isHilightSong;
  bool? isRender;
  bool? isUpload;
  dynamic currencySymbol;
  DateTime? deliveryDt;
  String? projectStatus;
  List<ProjectEvent>? projectEvents;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        projectId: json["ProjectId"],
        projectDt: DateTime.parse(json["ProjectDt"]),
        projectNm: json["ProjectNm"],
        clientCode: json["ClientCode"],
        price: json["Price"],
        paidAmt: json["PaidAmt"],
        dueAmt: json["DueAmt"],
        note: json["Note"],
        clientNote: json["ClientNote"],
        isEventSong: json["IsEventSong"],
        isHilightSong: json["IsHilightSong"],
        isRender: json["IsRender"],
        isUpload: json["IsUpload"],
        currencySymbol: json["CurrencySymbol"],
        deliveryDt: DateTime.parse(json["DeliveryDt"]),
        projectStatus: json["ProjectStatus"],
        projectEvents: List<ProjectEvent>.from(
            json["ProjectEvents"].map((x) => ProjectEvent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ProjectId": projectId,
        "ProjectDt": projectDt!.toIso8601String(),
        "ProjectNm": projectNm,
        "ClientCode": clientCode,
        "Price": price,
        "PaidAmt": paidAmt,
        "DueAmt": dueAmt,
        "Note": note,
        "ClientNote": clientNote,
        "IsEventSong": isEventSong,
        "IsHilightSong": isHilightSong,
        "IsRender": isRender,
        "IsUpload": isUpload,
        "CurrencySymbol": currencySymbol,
        "DeliveryDt": deliveryDt!.toIso8601String(),
        "ProjectStatus": projectStatus,
        "ProjectEvents":
            List<dynamic>.from(projectEvents!.map((x) => x.toJson())),
      };
}

class ProjectEvent {
  ProjectEvent({
    this.projectEventId,
    this.projectId,
    this.eventName,
    this.price,
    this.startDt,
    this.endDt,
    this.eventStatus,
    this.eventStatusDt,
    this.syncHourValue,
    this.syncWorkHour,
  });

  int? projectEventId;
  int? projectId;
  String? eventName;
  double? price;
  DateTime? startDt;
  DateTime? endDt;
  String? eventStatus;
  DateTime? eventStatusDt;
  int? syncHourValue;
  int? syncWorkHour;

  factory ProjectEvent.fromJson(Map<String, dynamic> json) => ProjectEvent(
        projectEventId: json["ProjectEventId"],
        projectId: json["ProjectId"],
        eventName: json["EventName"],
        price: json["Price"],
        startDt: DateTime.parse(json["StartDt"]),
        endDt: DateTime.parse(json["EndDt"]),
        eventStatus: json["EventStatus"],
        eventStatusDt: DateTime.parse(json["EventStatusDt"]),
        syncHourValue: json["SyncHourValue"],
        syncWorkHour: json["SyncWorkHour"],
      );

  Map<String, dynamic> toJson() => {
        "ProjectEventId": projectEventId,
        "ProjectId": projectId,
        "EventName": eventName,
        "Price": price,
        "StartDt": startDt!.toIso8601String(),
        "EndDt": endDt!.toIso8601String(),
        "EventStatus": eventStatus,
        "EventStatusDt": eventStatusDt!.toIso8601String(),
        "SyncHourValue": syncHourValue,
        "SyncWorkHour": syncWorkHour,
      };
}
