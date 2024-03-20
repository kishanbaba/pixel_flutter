class EmployeeLeaveUpdateRequestModel {
  int? leaveId;
  String? leaveNm;
  String? leaveDt;
  int? leaveTypeId;
  int? durationId;

  EmployeeLeaveUpdateRequestModel(
      {this.leaveId,
      this.leaveNm,
      this.leaveDt,
      this.leaveTypeId,
      this.durationId});

  EmployeeLeaveUpdateRequestModel.fromJson(Map<String, dynamic> json) {
    leaveId = json['LeaveId'];
    leaveNm = json['LeaveNm'];
    leaveDt = json['LeaveDt'];
    leaveTypeId = json['LeaveTypeId'];
    durationId = json['DurationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LeaveId'] = this.leaveId;
    data['LeaveNm'] = this.leaveNm;
    data['LeaveDt'] = this.leaveDt;
    data['LeaveTypeId'] = this.leaveTypeId;
    data['DurationId'] = this.durationId;
    return data;
  }
}
