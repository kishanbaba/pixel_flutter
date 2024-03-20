class ProjectRequestModel {
  int? clientId;
  String? search;
  int? projectStatus;
  String? orderBy;
  int? startRecord;
  int? pageSize;

  ProjectRequestModel(
      {this.clientId,
      this.search,
      this.projectStatus,
      this.orderBy,
      this.startRecord,
      this.pageSize});

  ProjectRequestModel.fromJson(Map<String, dynamic> json) {
    clientId = json['ClientId'];
    search = json['Search'];
    projectStatus = json['Project_Status'];
    orderBy = json['OrderBy'];
    startRecord = json['StartRecord'];
    pageSize = json['PageSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ClientId'] = this.clientId;
    data['Search'] = this.search;
    data['ProjectStatus'] = this.projectStatus;
    data['OrderBy'] = this.orderBy;
    data['StartRecord'] = this.startRecord;
    data['PageSize'] = this.pageSize;
    return data;
  }
}
