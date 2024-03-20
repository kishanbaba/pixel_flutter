class ClientUpdateRequestModel {
  int? clientId;
  String? emailId;
  String? loginPass;
  String? clientCode;
  String? firstNm;
  String? lastNm;
  String? companyNm;
  String? contactNo;
  int? currencyId;
  String? website;
  String? clientAddress;
  String? cityNm;
  String? stateNm;
  String? zipcode;
  int? countryId;

  ClientUpdateRequestModel(
      {this.clientId,
      this.emailId,
      this.loginPass,
      this.clientCode,
      this.firstNm,
      this.lastNm,
      this.companyNm,
      this.contactNo,
      this.currencyId,
      this.website,
      this.clientAddress,
      this.cityNm,
      this.stateNm,
      this.zipcode,
      this.countryId});

  ClientUpdateRequestModel.fromJson(Map<String, dynamic> json) {
    clientId = json['ClientId'];
    emailId = json['EmailId'];
    loginPass = json['LoginPass'];
    clientCode = json['ClientCode'];
    firstNm = json['FirstNm'];
    lastNm = json['LastNm'];
    companyNm = json['CompanyNm'];
    contactNo = json['ContactNo'];
    currencyId = json['CurrencyId'];
    website = json['Website'];
    clientAddress = json['ClientAddress'];
    cityNm = json['CityNm'];
    stateNm = json['StateNm'];
    zipcode = json['Zipcode'];
    countryId = json['CountryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ClientId'] = this.clientId;
    data['EmailId'] = this.emailId;
    data['LoginPass'] = this.loginPass;
    data['ClientCode'] = this.clientCode;
    data['FirstNm'] = this.firstNm;
    data['LastNm'] = this.lastNm;
    data['CompanyNm'] = this.companyNm;
    data['ContactNo'] = this.contactNo;
    data['CurrencyId'] = this.currencyId;
    data['Website'] = this.website;
    data['ClientAddress'] = this.clientAddress;
    data['CityNm'] = this.cityNm;
    data['StateNm'] = this.stateNm;
    data['Zipcode'] = this.zipcode;
    data['CountryId'] = this.countryId;
    return data;
  }
}
