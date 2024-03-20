import 'dart:convert';

DashboardResponseModel dashboardResponseModelFromJson(String str) =>
    DashboardResponseModel.fromJson(json.decode(str));

String dashboardResponseModelToJson(DashboardResponseModel data) =>
    json.encode(data.toJson());

class DashboardResponseModel {
  DashboardResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  Data? data;

  factory DashboardResponseModel.fromJson(Map<String, dynamic> json) =>
      DashboardResponseModel(
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
    this.pendingAmount,
    this.paidAmount,
    this.pendingProject,
    this.projects,
    this.sameDays,
  });

  String? pendingAmount;
  String? paidAmount;
  String? pendingProject;
  List<Project>? projects;
  List<SameDay>? sameDays;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pendingAmount: json["PendingAmount"],
        paidAmount: json["PaidAmount"],
        pendingProject: json["PendingProject"],
        projects: List<Project>.from(
            json["Projects"].map((x) => Project.fromJson(x))),
        sameDays: List<SameDay>.from(
            json["SameDays"].map((x) => SameDay.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PendingAmount": pendingAmount,
        "PendingProject": pendingProject,
        "SameDays": List<dynamic>.from(sameDays!.map((x) => x.toJson())),
      };
}

class Project {
  Project({
    this.projectId,
    this.projectDt,
    this.projectNm,
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
  double? price;
  double? paidAmt;
  double? dueAmt;
  dynamic note;
  dynamic clientNote;
  bool? isEventSong;
  bool? isHilightSong;
  bool? isRender;
  bool? isUpload;
  dynamic currencySymbol;
  DateTime? deliveryDt;
  dynamic projectStatus;
  List<ProjectEvent>? projectEvents;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        projectId: json["ProjectId"],
        projectDt: DateTime.parse(json["ProjectDt"]),
        projectNm: json["ProjectNm"],
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

class SameDay {
  SameDay({
    this.dayEditDt,
    this.dayEditDay,
    this.note,
  });

  DateTime? dayEditDt;
  String? dayEditDay;
  String? note;

  factory SameDay.fromJson(Map<String, dynamic> json) => SameDay(
        dayEditDt: DateTime.parse(json["DayEditDt"]),
        dayEditDay: json["DayEditDay"],
        note: json["Note"],
      );

  Map<String, dynamic> toJson() => {
        "DayEditDt": dayEditDt!.toIso8601String(),
        "DayEditDay": dayEditDay,
        "Note": note,
      };
}
