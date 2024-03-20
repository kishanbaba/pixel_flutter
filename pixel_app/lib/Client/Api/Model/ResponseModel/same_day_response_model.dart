// To parse this JSON data, do
//
//     final sameDayResponseModel = sameDayResponseModelFromJson(jsonString);

import 'dart:convert';

SameDayResponseModel sameDayResponseModelFromJson(String str) =>
    SameDayResponseModel.fromJson(json.decode(str));

String sameDayResponseModelToJson(SameDayResponseModel data) =>
    json.encode(data.toJson());

class SameDayResponseModel {
  SameDayResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  List<SameDay>? data;

  factory SameDayResponseModel.fromJson(Map<String, dynamic> json) =>
      SameDayResponseModel(
        statusCode: json["StatusCode"],
        status: json["Status"],
        message: json["Message"],
        data: List<SameDay>.from(json["Data"].map((x) => SameDay.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "Status": status,
        "Message": message,
        "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SameDay {
  SameDay({
    this.daySameId,
    this.daySameDt,
    this.daySameDay,
    this.clientId,
    this.qty,
    this.note,
  });

  int? daySameId;
  DateTime? daySameDt;
  String? daySameDay;
  int? clientId;
  int? qty;
  String? note;

  factory SameDay.fromJson(Map<String, dynamic> json) => SameDay(
        daySameId: json["DaySameId"],
        daySameDt: DateTime.parse(json["DaySameDt"]),
        daySameDay: json["DaySameDay"],
        clientId: json["ClientId"],
        qty: json["Qty"],
        note: json["Note"],
      );

  Map<String, dynamic> toJson() => {
        "DaySameId": daySameId,
        "DaySameDt": daySameDt!.toIso8601String(),
        "DaySameDay": daySameDay,
        "ClientId": clientId,
        "Qty": qty,
        "Note": note,
      };
}
