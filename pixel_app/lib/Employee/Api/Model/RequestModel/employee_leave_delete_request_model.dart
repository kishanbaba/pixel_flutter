class EmployeeLeaveDeleteRequestModel {
  int? leaveId;

  EmployeeLeaveDeleteRequestModel({this.leaveId});

  EmployeeLeaveDeleteRequestModel.fromJson(Map<String, dynamic> json) {
    leaveId = json['LeaveId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LeaveId'] = this.leaveId;
    return data;
  }
}
