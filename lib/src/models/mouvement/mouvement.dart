class Mouvement {
  int status;
  int code;
  String reference;

  Mouvement({this.status, this.code, this.reference});

  Mouvement.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    code = json['Code'];
    reference = json['Reference'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Status'] = this.status;
    data['Code'] = this.code;
    data['Reference'] = this.reference;
    return data;
  }
}
