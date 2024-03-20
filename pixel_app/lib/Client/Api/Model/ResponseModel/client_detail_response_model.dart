// To parse this JSON data, do
//
//     final clientDetailResponseModel = clientDetailResponseModelFromJson(jsonString);

import 'dart:convert';

ClientDetailResponseModel clientDetailResponseModelFromJson(String str) =>
    ClientDetailResponseModel.fromJson(json.decode(str));

String clientDetailResponseModelToJson(ClientDetailResponseModel data) =>
    json.encode(data.toJson());

class ClientDetailResponseModel {
  ClientDetailResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  Data? data;

  factory ClientDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      ClientDetailResponseModel(
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
    this.srNo,
    this.clientId,
    this.emailId,
    this.loginPass,
    this.clientCode,
    this.firstNm,
    this.lastNm,
    this.companyNm,
    this.contactNo,
    this.website,
    this.clientAddress,
    this.cityNm,
    this.stateNm,
    this.zipcode,
    this.countryId,
    this.currencyId,
    this.imgPath,
    this.loginDt,
    this.logoutDt,
    this.creDt,
    this.creById,
    this.modDt,
    this.modById,
    this.ipAddress,
    this.isExists,
    this.country,
    this.currency,
    this.projects,
    this.price,
    this.paid,
    this.pending,
  });

  int? srNo;
  int? clientId;
  String? emailId;
  String? loginPass;
  String? clientCode;
  String? firstNm;
  String? lastNm;
  String? companyNm;
  String? contactNo;
  String? website;
  String? clientAddress;
  String? cityNm;
  String? stateNm;
  String? zipcode;
  int? countryId;
  int? currencyId;
  String? imgPath;
  DateTime? loginDt;
  DateTime? logoutDt;
  DateTime? creDt;
  int? creById;
  DateTime? modDt;
  int? modById;
  String? ipAddress;
  bool? isExists;
  dynamic country;
  Currency? currency;
  dynamic projects;
  double? price;
  double? paid;
  double? pending;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        srNo: json["SrNo"],
        clientId: json["ClientId"],
        emailId: json["EmailId"],
        loginPass: json["LoginPass"],
        clientCode: json["ClientCode"],
        firstNm: json["FirstNm"],
        lastNm: json["LastNm"],
        companyNm: json["CompanyNm"],
        contactNo: json["ContactNo"],
        website: json["Website"],
        clientAddress: json["ClientAddress"],
        cityNm: json["CityNm"],
        stateNm: json["StateNm"],
        zipcode: json["Zipcode"],
        countryId: json["CountryId"],
        currencyId: json["CurrencyId"],
        imgPath: json["ImgPath"],
        loginDt: DateTime.parse(json["LoginDt"]),
        logoutDt: DateTime.parse(json["LogoutDt"]),
        creDt: DateTime.parse(json["CreDt"]),
        creById: json["CreById"],
        modDt: DateTime.parse(json["ModDt"]),
        modById: json["ModById"],
        ipAddress: json["IpAddress"],
        isExists: json["IsExists"],
        country: json["Country"],
        currency: Currency.fromJson(json["Currency"]),
        projects: json["Projects"],
        price: json["Price"],
        paid: json["Paid"],
        pending: json["Pending"],
      );

  Map<String, dynamic> toJson() => {
        "SrNo": srNo,
        "ClientId": clientId,
        "EmailId": emailId,
        "LoginPass": loginPass,
        "ClientCode": clientCode,
        "FirstNm": firstNm,
        "LastNm": lastNm,
        "CompanyNm": companyNm,
        "ContactNo": contactNo,
        "Website": website,
        "ClientAddress": clientAddress,
        "CityNm": cityNm,
        "StateNm": stateNm,
        "Zipcode": zipcode,
        "CountryId": countryId,
        "CurrencyId": currencyId,
        "ImgPath": imgPath,
        "LoginDt": loginDt!.toIso8601String(),
        "LogoutDt": logoutDt!.toIso8601String(),
        "CreDt": creDt!.toIso8601String(),
        "CreById": creById,
        "ModDt": modDt!.toIso8601String(),
        "ModById": modById,
        "IpAddress": ipAddress,
        "IsExists": isExists,
        "Country": country,
        "Currency": currency!.toJson(),
        "Projects": projects,
        "Price": price,
        "Paid": paid,
        "Pending": pending,
      };
}

class Currency {
  Currency({
    this.currencyId,
    this.currencyNm,
    this.currencyCd,
    this.currencySymbol,
    this.isExists,
  });

  int? currencyId;
  dynamic currencyNm;
  String? currencyCd;
  String? currencySymbol;
  bool? isExists;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        currencyId: json["CurrencyId"],
        currencyNm: json["CurrencyNm"],
        currencyCd: json["CurrencyCd"],
        currencySymbol: json["CurrencySymbol"],
        isExists: json["IsExists"],
      );

  Map<String, dynamic> toJson() => {
        "CurrencyId": currencyId,
        "CurrencyNm": currencyNm,
        "CurrencyCd": currencyCd,
        "CurrencySymbol": currencySymbol,
        "IsExists": isExists,
      };
}
