// To parse this JSON data, do
//
//     final clientPaymentResponseModel = clientPaymentResponseModelFromJson(jsonString);

import 'dart:convert';

ClientPaymentResponseModel clientPaymentResponseModelFromJson(String str) =>
    ClientPaymentResponseModel.fromJson(json.decode(str));

String clientPaymentResponseModelToJson(ClientPaymentResponseModel data) =>
    json.encode(data.toJson());

class ClientPaymentResponseModel {
  ClientPaymentResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  Data? data;

  factory ClientPaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      ClientPaymentResponseModel(
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
    this.tbData,
    this.dueAmount,
    this.paidAmount,
  });

  List<TbDatum>? tbData;
  String? dueAmount;
  String? paidAmount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tbData:
            List<TbDatum>.from(json["tbData"].map((x) => TbDatum.fromJson(x))),
        dueAmount: json["DueAmount"],
        paidAmount: json["PaidAmount"],
      );

  Map<String, dynamic> toJson() => {
        "tbData": List<dynamic>.from(tbData!.map((x) => x.toJson())),
        "DueAmount": dueAmount,
        "PaidAmount": paidAmount,
      };
}

class TbDatum {
  TbDatum({
    this.dt,
    this.payments,
  });

  String? dt;
  List<Payment>? payments;

  factory TbDatum.fromJson(Map<String, dynamic> json) => TbDatum(
        dt: json["Dt"],
        payments: List<Payment>.from(
            json["Payments"].map((x) => Payment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Dt": dt,
        "Payments": List<dynamic>.from(payments!.map((x) => x.toJson())),
      };
}

class Payment {
  Payment({
    this.paymentId,
    this.paymentDt,
    this.projectId,
    this.projectName,
    this.amount,
    this.note,
    this.currencySymbol,
    this.dt,
  });

  int? paymentId;
  DateTime? paymentDt;
  int? projectId;
  String? projectName;
  dynamic amount;
  String? note;
  String? currencySymbol;
  String? dt;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        paymentId: json["PaymentId"],
        paymentDt: DateTime.parse(json["PaymentDt"]),
        projectId: json["ProjectId"],
        projectName: json["ProjectName"],
        amount: json["Amount"],
        note: json["Note"],
        currencySymbol: json["CurrencySymbol"],
        dt: json["Dt"],
      );

  Map<String, dynamic> toJson() => {
        "PaymentId": paymentId,
        "PaymentDt": paymentDt!.toIso8601String(),
        "ProjectId": projectId,
        "ProjectName": projectName,
        "Amount": amount,
        "Note": note,
        "CurrencySymbol": currencySymbol,
        "Dt": dt,
      };
}
