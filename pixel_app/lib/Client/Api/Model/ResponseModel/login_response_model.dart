// To parse this JSON data, do
//
//     final loginResposeModel = loginResposeModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  List<Datum>? data;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        statusCode: json["StatusCode"],
        status: json["Status"] ?? '',
        message: json["Message"] ?? '',
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "Status": status,
        "Message": message,
        "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.clientId,
    this.emailId,
    this.clientCode,
    this.firstName,
    this.lastName,
    this.companyName,
    this.contactNo,
    this.website,
    this.clientAddress,
    this.city,
    this.state,
    this.zipCode,
    this.countryId,
    this.currencyId,
    this.imagePath,
  });

  int? clientId;
  String? emailId;
  String? clientCode;
  String? firstName;
  String? lastName;
  String? companyName;
  dynamic contactNo;
  dynamic website;
  String? clientAddress;
  dynamic city;
  dynamic state;
  dynamic zipCode;
  int? countryId;
  int? currencyId;
  dynamic imagePath;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        clientId: json["ClientId"],
        emailId: json["EmailId"] ?? '',
        clientCode: json["ClientCode"] ?? '',
        firstName: json["FirstName"] ?? '',
        lastName: json["LastName"] ?? '',
        companyName: json["CompanyName"] ?? '',
        contactNo: json["ContactNo"] ?? '',
        website: json["Website"] ?? '',
        clientAddress: json["ClientAddress"] ?? '',
        city: json["City"] ?? '',
        state: json["State"] ?? '',
        zipCode: json["ZipCode"] ?? '',
        countryId: json["CountryId"] ?? 0,
        currencyId: json["CurrencyId"] ?? 0,
        imagePath: json["ImagePath"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "ClientId": clientId,
        "EmailId": emailId,
        "ClientCode": clientCode,
        "FirstName": firstName,
        "LastName": lastName,
        "CompanyName": companyName,
        "ContactNo": contactNo,
        "Website": website,
        "ClientAddress": clientAddress,
        "City": city,
        "State": state,
        "ZipCode": zipCode,
        "CountryId": countryId,
        "CurrencyId": currencyId,
        "ImagePath": imagePath,
      };
}
