class EmployeeLeaveAddRequestModel {
  String? leaveNm;
  String? leaveDt;
  int? leaveTypeId;
  int? durationId;

  EmployeeLeaveAddRequestModel(
      {this.leaveNm, this.leaveDt, this.leaveTypeId, this.durationId});

  EmployeeLeaveAddRequestModel.fromJson(Map<String, dynamic> json) {
    leaveNm = json['LeaveNm'];
    leaveDt = json['LeaveDt'];
    leaveTypeId = json['LeaveTypeId'];
    durationId = json['DurationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LeaveNm'] = this.leaveNm;
    data['LeaveDt'] = this.leaveDt;
    data['LeaveTypeId'] = this.leaveTypeId;
    data['DurationId'] = this.durationId;
    return data;
  }
}
