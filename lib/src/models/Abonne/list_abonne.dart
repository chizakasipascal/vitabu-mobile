import 'abonne.dart';

class ListAbonne {
  int status;
  List<Abonne> abonnes;

  ListAbonne({this.status, this.abonnes});

  ListAbonne.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    if (json['Abonnes'] != null) {
      abonnes = List<Abonne>();
      json['Abonnes'].forEach((v) {
        abonnes.add(Abonne.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Status'] = this.status;
    if (this.abonnes != null) {
      data['Abonnes'] = this.abonnes.map((v) => v.toMap()).toList();
    }
    return data;
  }
}
