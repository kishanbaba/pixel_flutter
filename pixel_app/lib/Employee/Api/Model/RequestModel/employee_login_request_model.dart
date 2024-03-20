class EmployeeLoginRequestModel {
  String? loginNm;
  String? loginPass;
  String? fcm;

  EmployeeLoginRequestModel({this.loginNm, this.loginPass,this.fcm});

  EmployeeLoginRequestModel.fromJson(Map<String, dynamic> json) {
    loginNm = json['LoginNm'];
    loginPass = json['LoginPass'];
    fcm = json['Fcm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LoginNm'] = this.loginNm;
    data['LoginPass'] = this.loginPass;
    data['Fcm'] = this.fcm;
    return data;
  }
}
