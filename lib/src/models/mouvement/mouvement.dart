class Mouvement {
  int status;
  int code;
  String titre;
  String reference;

  Mouvement({this.status, this.code, this.titre, this.reference});

  Mouvement.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    code = json['Code'];
    titre = json['Titre'];
    reference = json['Reference'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Status'] = this.status;
    data['Code'] = this.code;
    data['Titre'] = this.titre;
    data['Reference'] = this.reference;
    return data;
  }
}
