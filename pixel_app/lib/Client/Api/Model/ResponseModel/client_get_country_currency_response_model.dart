// To parse this JSON data, do
//
//     final ClientGetCountryCurrencyResponseModel = ClientGetCountryCurrencyResponseModelFromJson(jsonString);

import 'dart:convert';

ClientGetCountryCurrencyResponseModel
    clientGetCountryCurrencyResponseModelFromJson(String str) =>
        ClientGetCountryCurrencyResponseModel.fromJson(json.decode(str));

String clientGetCountryCurrencyResponseModelToJson(
        ClientGetCountryCurrencyResponseModel data) =>
    json.encode(data.toJson());

class ClientGetCountryCurrencyResponseModel {
  ClientGetCountryCurrencyResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  Data? data;

  factory ClientGetCountryCurrencyResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ClientGetCountryCurrencyResponseModel(
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
    this.countries,
    this.currencies,
  });

  List<Country>? countries;
  List<Country>? currencies;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        countries: List<Country>.from(
            json["Countries"].map((x) => Country.fromJson(x))),
        currencies: List<Country>.from(
            json["Currencies"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Countries": List<dynamic>.from(countries!.map((x) => x.toJson())),
        "Currencies": List<dynamic>.from(currencies!.map((x) => x.toJson())),
      };
}

class Country {
  Country({
    this.id,
    this.text,
  });

  int? id;
  String? text;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
      };
}
