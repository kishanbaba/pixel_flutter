class OfficeCloseDayRequestModel {
  int? year;
  int? month;

  OfficeCloseDayRequestModel({this.year, this.month});

  OfficeCloseDayRequestModel.fromJson(Map<String, dynamic> json) {
    year = json['Year'];
    month = json['Month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Year'] = this.year;
    data['Month'] = this.month;
    return data;
  }
}
