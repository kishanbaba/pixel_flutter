class EmployeeLeavesRequestModel {
  String? search;
  int? projectStatus;
  String? orderBy;
  int? startRecord;
  int? pageSize;

  EmployeeLeavesRequestModel(
      {this.search,
      this.projectStatus,
      this.orderBy,
      this.startRecord,
      this.pageSize});

  EmployeeLeavesRequestModel.fromJson(Map<String, dynamic> json) {
    search = json['Search'];
    projectStatus = json['ProjectStatus'];
    orderBy = json['OrderBy'];
    startRecord = json['StartRecord'];
    pageSize = json['PageSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Search'] = this.search;
    data['ProjectStatus'] = this.projectStatus;
    data['OrderBy'] = this.orderBy;
    data['StartRecord'] = this.startRecord;
    data['PageSize'] = this.pageSize;
    return data;
  }
}
