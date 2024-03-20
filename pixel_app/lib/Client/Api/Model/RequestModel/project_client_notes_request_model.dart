class ProjectClientNotesRequestModel {
  int? projectId;
  String? clientNote;

  ProjectClientNotesRequestModel({this.projectId, this.clientNote});

  ProjectClientNotesRequestModel.fromJson(Map<String, dynamic> json) {
    projectId = json['ProjectId'];
    clientNote = json['ClientNote'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProjectId'] = this.projectId;
    data['ClientNote'] = this.clientNote;
    return data;
  }
}
