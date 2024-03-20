// To parse this JSON data, do
//
//     final officeCloseDayResponseModel = officeCloseDayResponseModelFromJson(jsonString);

import 'dart:convert';

OfficeCloseDayResponseModel officeCloseDayResponseModelFromJson(String str) =>
    OfficeCloseDayResponseModel.fromJson(json.decode(str));

String officeCloseDayResponseModelToJson(OfficeCloseDayResponseModel data) =>
    json.encode(data.toJson());

class OfficeCloseDayResponseModel {
  OfficeCloseDayResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  List<OfficeCloseDay>? data;

  factory OfficeCloseDayResponseModel.fromJson(Map<String, dynamic> json) =>
      OfficeCloseDayResponseModel(
        statusCode: json["StatusCode"],
        status: json["Status"],
        message: json["Message"],
        data: List<OfficeCloseDay>.from(
            json["Data"].map((x) => OfficeCloseDay.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "Status": status,
        "Message": message,
        "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class OfficeCloseDay {
  OfficeCloseDay({
    this.srNo,
    this.holidayId,
    this.holidayNm,
    this.holidayDt,
    this.holidayDay,
    this.creDt,
    this.creById,
    this.modDt,
    this.modById,
    this.ipAddress,
    this.isExists,
  });

  int? srNo;
  int? holidayId;
  String? holidayNm;
  String? holidayDt;
  String? holidayDay;
  String? creDt;
  int? creById;
  String? modDt;
  int? modById;
  dynamic ipAddress;
  bool? isExists;

  factory OfficeCloseDay.fromJson(Map<String, dynamic> json) => OfficeCloseDay(
        srNo: json["SrNo"],
        holidayId: json["HolidayId"],
        holidayNm: json["HolidayNm"],
        holidayDt: json["HolidayDt"],
        holidayDay: json["HolidayDay"],
        creDt: json["CreDt"],
        creById: json["CreById"],
        modDt: json["ModDt"],
        modById: json["ModById"],
        ipAddress: json["IpAddress"],
        isExists: json["IsExists"],
      );

  Map<String, dynamic> toJson() => {
        "SrNo": srNo,
        "HolidayId": holidayId,
        "HolidayNm": holidayNm,
        "HolidayDt": holidayDt,
        "HolidayDay": holidayDay,
        "CreDt": creDt,
        "CreById": creById,
        "ModDt": modDt,
        "ModById": modById,
        "IpAddress": ipAddress,
        "IsExists": isExists,
      };
}
