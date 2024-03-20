class ClientCreateRequestModel {
  String? emailId;
  String? loginPass;
  String? clientCode;
  String? firstNm;
  String? lastNm;
  String? companyNm;
  String? contactNo;
  int? countryId;
  int? currencyId;

  ClientCreateRequestModel(
      {this.emailId,
      this.loginPass,
      this.clientCode,
      this.firstNm,
      this.lastNm,
      this.companyNm,
      this.contactNo,
      this.countryId,
      this.currencyId});

  ClientCreateRequestModel.fromJson(Map<String, dynamic> json) {
    emailId = json['EmailId'];
    loginPass = json['LoginPass'];
    clientCode = json['ClientCode'];
    firstNm = json['FirstNm'];
    lastNm = json['LastNm'];
    companyNm = json['CompanyNm'];
    contactNo = json['ContactNo'];
    countryId = json['CountryId'];
    currencyId = json['CurrencyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['EmailId'] = this.emailId;
    data['LoginPass'] = this.loginPass;
    data['ClientCode'] = this.clientCode;
    data['FirstNm'] = this.firstNm;
    data['LastNm'] = this.lastNm;
    data['CompanyNm'] = this.companyNm;
    data['ContactNo'] = this.contactNo;
    data['CountryId'] = this.countryId;
    data['CurrencyId'] = this.currencyId;
    return data;
  }
}
