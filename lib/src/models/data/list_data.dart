import 'data.dart';

class ListData {
  int status;
  List<Data> data;

  ListData({this.status, this.data});

  ListData.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    if (json['Data'] != null) {
      data = List<Data>();
      json['Data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Status'] = this.status;
    if (this.data != null) {
      data['Data'] = this.data.map((v) => v.toMap()).toList();
    }
    return data;
  }
}
