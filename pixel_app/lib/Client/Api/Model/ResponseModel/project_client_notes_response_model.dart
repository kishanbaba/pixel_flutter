// To parse this JSON data, do
//
//     final projectClientNotesResponseModel = projectClientNotesResponseModelFromJson(jsonString);

import 'dart:convert';

ProjectClientNotesResponseModel projectClientNotesResponseModelFromJson(
        String str) =>
    ProjectClientNotesResponseModel.fromJson(json.decode(str));

String projectClientNotesResponseModelToJson(
        ProjectClientNotesResponseModel data) =>
    json.encode(data.toJson());

class ProjectClientNotesResponseModel {
  ProjectClientNotesResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  int? data;

  factory ProjectClientNotesResponseModel.fromJson(Map<String, dynamic> json) =>
      ProjectClientNotesResponseModel(
        statusCode: json["StatusCode"],
        status: json["Status"] ?? '',
        message: json["Message"] ?? '',
        data: json["Data"],
      );

  Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "Status": status,
        "Message": message,
        "Data": data,
      };
}
