class EmpruntBody {
  int quantite;
  String refOuvrage;
  int refAbonne;

  EmpruntBody({this.quantite, this.refOuvrage, this.refAbonne});

  EmpruntBody.fromJson(Map<String, dynamic> json) {
    quantite = json['Quantite'];
    refOuvrage = json['RefOuvrage'];
    refAbonne = json['RefAbonne'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Quantite'] = this.quantite;
    data['RefOuvrage'] = this.refOuvrage;
    data['RefAbonne'] = this.refAbonne;
    return data;
  }
}
