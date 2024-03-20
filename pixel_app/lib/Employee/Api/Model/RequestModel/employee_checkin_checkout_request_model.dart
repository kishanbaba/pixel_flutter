class EmployeeCheckInCheckOutRequestModel {
  String? checkInOut;

  EmployeeCheckInCheckOutRequestModel({this.checkInOut});

  EmployeeCheckInCheckOutRequestModel.fromJson(Map<String, dynamic> json) {
    checkInOut = json['CheckInOut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CheckInOut'] = this.checkInOut;
    return data;
  }
}
