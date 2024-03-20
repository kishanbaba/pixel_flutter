class ChangePasswordRequestModel {
  String? currentPassword;
  String? newPassword;

  ChangePasswordRequestModel({this.currentPassword, this.newPassword});

  ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) {
    currentPassword = json['CurrentPassword'];
    newPassword = json['NewPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CurrentPassword'] = this.currentPassword;
    data['NewPassword'] = this.newPassword;
    return data;
  }
}
