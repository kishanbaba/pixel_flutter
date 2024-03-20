class LoginRequestModel {
  String? emailId;
  String? loginPass;
  String? fcm;

  LoginRequestModel({this.emailId, this.loginPass ,this.fcm});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    emailId = json['EmailId'];
    loginPass = json['LoginPass'];
    fcm = json['Fcm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmailId'] = this.emailId;
    data['LoginPass'] = this.loginPass;
    data['fcm'] = this.fcm;
    return data;
  }
}
