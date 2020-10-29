class RemiseBody {
  int quantite;
  int reference;
  String observation;

  RemiseBody({this.quantite, this.reference, this.observation});

  RemiseBody.fromJson(Map<String, dynamic> json) {
    quantite = json['Quantite'];
    reference = json['Reference'];
    observation = json['Observation'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Quantite'] = this.quantite;
    data['Reference'] = this.reference;
    data['Observation'] = this.observation;
    return data;
  }
}
