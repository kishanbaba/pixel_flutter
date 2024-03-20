class EmployeeStartEndProjectEventRequestModel {
  int? projectEventId;

  EmployeeStartEndProjectEventRequestModel({this.projectEventId});

  EmployeeStartEndProjectEventRequestModel.fromJson(Map<String, dynamic> json) {
    projectEventId = json['ProjectEventId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProjectEventId'] = this.projectEventId;
    return data;
  }
}
