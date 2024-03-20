class SameDayAddRequestModel {
  String? daySameDt;
  int? qty;
  String? note;

  SameDayAddRequestModel({this.daySameDt, this.qty, this.note});

  SameDayAddRequestModel.fromJson(Map<String, dynamic> json) {
    daySameDt = json['DaySameDt'];
    qty = json['Qty'];
    note = json['Note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DaySameDt'] = this.daySameDt;
    data['Qty'] = this.qty;
    data['Note'] = this.note;
    return data;
  }
}
