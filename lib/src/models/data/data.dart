class Data {
  int id;
  String designation;

  Data({this.id, this.designation});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    designation = json['Designation'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Id'] = this.id;
    data['Designation'] = this.designation;
    return data;
  }
}
