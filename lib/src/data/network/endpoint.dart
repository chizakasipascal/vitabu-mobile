class EndPoint {
  EndPoint._();

  static const String _baseUrl = "http://127.0.0.1:9000/api";

  static const String emprunt = _baseUrl + "/emprunt";
  static const String getListAuteur = _baseUrl + "/auteur";
  static const String getListType = _baseUrl + "/type";
  static const String getListEditeur = _baseUrl + "/editeur";
  static const String getListClasse = _baseUrl + "/classe";
}
