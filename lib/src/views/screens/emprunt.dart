import 'package:flutter/material.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:vitabu/src/data/api/api_repository.dart';
import 'package:vitabu/src/models/abonne/abonne.dart';
import 'file:///D:/Ardin/Projects/Mobile/vitabu-mobile/lib/src/models/mouvement/emprunt_body.dart';
import 'package:vitabu/src/views/widgets/button.dart';
import 'package:vitabu/src/views/widgets/scan_button.dart';
import 'package:vitabu/src/views/widgets/text_box.dart';

class EmpruntScreen extends StatefulWidget {
  const EmpruntScreen({Key key}) : super(key: key);

  @override
  _EmpruntScreenState createState() => _EmpruntScreenState();
}

class _EmpruntScreenState extends State<EmpruntScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _code = TextEditingController();
  TextEditingController _quantite = TextEditingController();
  TextEditingController _refAbonne = TextEditingController();

  ApiRepository _api = ApiRepository();

  var _listAbonnes;
  var _asyncCall = false;

  void stopNFC() {
    FlutterNfcReader.stop().then((response) {
      print("XXXXXXXXXXXXXXXXXXXXXXXX STOP : ${response.status.toString()}");
    });
  }

  void _clearFields() {
    _code.clear();
    _refAbonne.clear();
    _quantite.clear();
  }

  void readNFC() {
    Fluttertoast.showToast(
      msg: "Scan en cours ...",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black38,
      textColor: Colors.black,
      fontSize: 16.0,
    );

    _clearFields();

    FlutterNfcReader.read().then((onData) {
      print("XXXXXXXXXXXXXXXXXXXXXXXX ID : ${onData.id.toString()}");
      print("XXXXXXXXXXXXXXXXXXXXXXXX CONTENT : ${onData.content.toString()}");
      print("XXXXXXXXXXXXXXXXXXXXXXXX STATUS : ${onData.status.toString()}");

      setState(() {
        _code.text = onData.id.toString();
      });
    });
  }

  void _saveEmprunt() {
    if (_formKey.currentState.validate()) {
      Future.delayed(Duration(seconds: 2)).then((value) {
        _api
            .postEmprunt(
          EmpruntBody(
            quantite: int.parse(_quantite.text),
            refAbonne: int.parse(_refAbonne.text),
            refOuvrage: _code.text,
          ),
        )
            .then(
          (value) {
            Fluttertoast.showToast(
              msg: value.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.black38,
              textColor: Colors.black,
              fontSize: 16.0,
            );
            setState(() {
              _asyncCall = false;
              _clearFields();
            });
          },
        );
      });
    }
  }

  List<Abonne> _getSuggestions(String query) {
    List<Abonne> matches = List<Abonne>();
    matches.addAll(_listAbonnes);
    matches.retainWhere((e) =>
        (e.nom.toLowerCase().contains(query.toLowerCase()) ||
            e.postnom.toLowerCase().contains(query.toLowerCase())));
    return matches;
  }

  @override
  void initState() {
    super.initState();
    _api.getAbonnes().then((value) => _listAbonnes = value.abonnes);
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _asyncCall,
      progressIndicator: CircularProgressIndicator(
        backgroundColor: Colors.black54,
      ),
      child: Container(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
            children: [
              ScanButton(
                caption: "Emprunt",
                onTap: () => readNFC(),
              ),
              SizedBox(
                height: 40,
                child: Center(
                  child: Container(
                    height: 1,
                    color: Theme.of(context).cursorColor,
                  ),
                ),
              ),
              SizedBox(
                child: buildTextBox(
                  "Code RFID",
                  enable: false,
                  controller: _code,
                  validator: (x) =>
                      x.isEmpty || x == null ? "Le code ouvrage vide" : null,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                child: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _refAbonne,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
                      labelText: "Code abonné",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  suggestionsCallback: (pattern) {
                    return _getSuggestions(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text("${suggestion.numero} ${suggestion.nom} "
                          "${suggestion.postnom}"),
                    );
                  },
                  transitionBuilder: (context, suggestionsBox, controller) {
                    return suggestionsBox;
                  },
                  onSuggestionSelected: (suggestion) {
                    this._refAbonne.text = suggestion.numero;
                  },
                  validator: (x) =>
                      x.isEmpty || x == null ? "Le code abonné vide" : null,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        buildTextBox(
                          "Quantité",
                          enable: false,
                          controller: _quantite,
                          validator: (x) => x.isEmpty || x == null
                              ? "Le quantité vide"
                              : null,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(
                        Icons.remove_circle,
                        size: 38,
                      ),
                      onPressed: () {
                        setState(() {
                          if (int.parse(_quantite.text) > 1) {
                            _quantite.text =
                                (int.parse(_quantite.text) - 1).toString();
                          }
                        });
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        size: 38,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_quantite.text.isEmpty)
                            _quantite.text = "1";
                          else if (int.parse(_quantite.text) >= 1) {
                            _quantite.text =
                                (int.parse(_quantite.text) + 1).toString();
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Button(
                caption: "VALIDER",
                onPressed: () {
                  setState(() {
                    _asyncCall = true;
                  });
                  _saveEmprunt();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
