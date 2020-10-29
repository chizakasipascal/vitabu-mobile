class AcquisitionBody {
  int code;
  String titre;
  String isbn;
  String publication;
  String version;
  int page;
  int refType;
  int refClasse;
  int refEditeur;
  int refAuteur;

  AcquisitionBody(
      {this.code,
      this.titre,
      this.isbn,
      this.publication,
      this.version,
      this.page,
      this.refType,
      this.refAuteur,
      this.refClasse,
      this.refEditeur});

  AcquisitionBody.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    titre = json['Titre'];
    isbn = json['Isbn'];
    publication = json['Publication'];
    version = json['Version'];
    page = json['Page'];
    refAuteur = json['RefAuteur'];
    refType = json['RefType'];
    refEditeur = json['RefEditeur'];
    refClasse = json['RefClass'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Code'] = this.code;
    data['Titre'] = this.titre;
    data['Isbn'] = this.isbn;
    data['Publication'] = this.publication;
    data['Version'] = this.version;
    data['Page'] = this.page;
    data['RefAuteur'] = this.refAuteur;
    data['RefType'] = this.refType;
    data['RefEditeur'] = this.refEditeur;
    data['RefClass'] = this.refClasse;
    return data;
  }
}
