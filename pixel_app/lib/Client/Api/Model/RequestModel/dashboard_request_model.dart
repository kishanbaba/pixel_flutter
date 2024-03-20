class DashboardRequestModel {
  String? date;

  DashboardRequestModel({this.date});

  DashboardRequestModel.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    return data;
  }
}
