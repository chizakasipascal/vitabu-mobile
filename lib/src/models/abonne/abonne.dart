class Abonne {
  String numero;
  String nom;
  String postnom;
  String prenom;
  double montant;

  Abonne({this.numero, this.nom, this.postnom, this.prenom, this.montant});

  Abonne.fromJson(Map<String, dynamic> json) {
    numero = json['Numero'];
    nom = json['Nom'];
    postnom = json['Postnom'];
    prenom = json['Prenom'];
    montant = json['Montant'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Numero'] = this.numero;
    data['Nom'] = this.nom;
    data['Postnom'] = this.postnom;
    data['Prenom'] = this.prenom;
    data['Montant'] = this.montant;
    return data;
  }
}
