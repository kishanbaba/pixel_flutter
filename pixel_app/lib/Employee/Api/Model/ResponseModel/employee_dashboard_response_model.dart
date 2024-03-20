import 'dart:convert';

EmployeeDashboardResponseModel employeeDashboardResponseModelFromJson(
        String str) =>
    EmployeeDashboardResponseModel.fromJson(json.decode(str));

String employeeDashboardResponseModelToJson(
        EmployeeDashboardResponseModel data) =>
    json.encode(data.toJson());

class EmployeeDashboardResponseModel {
  EmployeeDashboardResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  Data? data;

  factory EmployeeDashboardResponseModel.fromJson(Map<String, dynamic> json) =>
      EmployeeDashboardResponseModel(
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
    this.events,
    this.attendance,
    this.checkInOut,
  });

  List<Event>? events;
  List<Attendance>? attendance;
  CheckInOut? checkInOut;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        events: List<Event>.from(json["Events"].map((x) => Event.fromJson(x))),
        attendance: List<Attendance>.from(
            json["Attendance"].map((x) => Attendance.fromJson(x))),
        checkInOut: json["CheckInOut"] == null
            ? null
            : CheckInOut.fromJson(json["CheckInOut"]),
      );

  Map<String, dynamic> toJson() => {
        "Events": List<dynamic>.from(events!.map((x) => x.toJson())),
        "Attendance": List<dynamic>.from(attendance!.map((x) => x.toJson())),
        "CheckInOut": checkInOut!.toJson(),
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

class CheckInOut {
  CheckInOut({
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
  dynamic ipAdd;
  bool? isExists;

  factory CheckInOut.fromJson(Map<String, dynamic> json) => CheckInOut(
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

class Event {
  Event({
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
  dynamic eventName;
  double? price;
  dynamic startDt;
  dynamic endDt;
  dynamic eventStatus;
  DateTime? eventStatusDt;
  int? syncHourValue;
  int? syncWorkHour;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        projectEventId: json["ProjectEventId"],
        projectId: json["ProjectId"],
        eventName: json["EventName"],
        price: json["Price"],
        startDt: json["StartDt"],
        endDt: json["EndDt"],
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
        "StartDt": startDt,
        "EndDt": endDt,
        "EventStatus": eventStatus,
        "EventStatusDt": eventStatusDt!.toIso8601String(),
        "SyncHourValue": syncHourValue,
        "SyncWorkHour": syncWorkHour,
      };
}
