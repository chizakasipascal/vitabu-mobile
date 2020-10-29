import 'package:flutter/material.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:vitabu/src/data/api/api_repository.dart';
import 'package:vitabu/src/models/data/acquisition.dart';
import 'package:vitabu/src/models/mouvement/acquisition_body.dart';
import 'package:vitabu/src/views/widgets/button.dart';
import 'package:vitabu/src/views/widgets/scan_button.dart';
import 'package:vitabu/src/views/widgets/text_box.dart';

class AcquisitionScreen extends StatefulWidget {
  const AcquisitionScreen({Key key}) : super(key: key);

  @override
  _AcquisitionScreenState createState() => _AcquisitionScreenState();
}

class _AcquisitionScreenState extends State<AcquisitionScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _code = TextEditingController();
  TextEditingController _titre = TextEditingController();
  TextEditingController _auteur = TextEditingController();
  TextEditingController _type = TextEditingController();
  TextEditingController _editeur = TextEditingController();
  TextEditingController _class = TextEditingController();
  TextEditingController _isbn = TextEditingController();
  TextEditingController _publication = TextEditingController();
  TextEditingController _version = TextEditingController();
  TextEditingController _page = TextEditingController();

  ApiRepository _api = ApiRepository();
  Acquisition _acq = Acquisition();

  var _listAuteur;
  var _listType;
  var _listEditeur;
  var _listClass;
  var _asyncCall = false;

  void stopNFC() {
    FlutterNfcReader.stop().then((response) {
      print("XXXXXXXXXXXXXXXXXXXXXXXX STOP : ${response.status.toString()}");
    });
  }

  void _clearFields() {
    _code.clear();
    _titre.clear();
    _auteur.clear();
    _type.clear();
    _editeur.clear();
    _class.clear();
    _isbn.clear();
    _publication.clear();
    _version.clear();
    _page.clear();
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

  void _saveAcquisition() {
    if (_formKey.currentState.validate()) {
      Future.delayed(Duration(seconds: 2)).then((value) {
        _api
            .postAcquisition(
          AcquisitionBody(
            code: _code.text,
            titre: _titre.text,
            publication: _publication.text,
            version: _version.text,
            isbn: _isbn.text.toUpperCase(),
            page: int.parse(_page.text),
            refType: _acq.type,
            refClasse: _acq.classe,
            refEditeur: _acq.editeur,
            refAuteur: _acq.auteur,
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

  List<dynamic> _getSuggestions(String query, int cas) {
    List<dynamic> matches = List<dynamic>();

    switch (cas) {
      case 1:
        matches.clear();
        matches.addAll(_listAuteur);
        matches.retainWhere(
          (e) => (e.designation.toLowerCase().contains(query.toLowerCase())),
        );
        break;

      case 2:
        matches.clear();
        matches.addAll(_listType);
        matches.retainWhere(
          (e) => (e.designation.toLowerCase().contains(query.toLowerCase())),
        );
        break;

      case 3:
        matches.clear();
        matches.addAll(_listEditeur);
        matches.retainWhere(
          (e) => (e.designation.toLowerCase().contains(query.toLowerCase())),
        );
        break;

      case 4:
        matches.clear();
        matches.addAll(_listClass);
        matches.retainWhere(
          (e) => (e.designation.toLowerCase().contains(query.toLowerCase())),
        );
        break;
    }
    return matches;
  }

  @override
  void initState() {
    super.initState();
    _api.getAuteurs().then((value) => _listAuteur = value.data);
    _api.getTypes().then((value) => _listType = value.data);
    _api.getEditeurs().then((value) => _listEditeur = value.data);
    _api.getClasses().then((value) => _listClass = value.data);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Acquisition",
            style: Theme.of(context).textTheme.headline6,
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        body: ModalProgressHUD(
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
                    caption: "Nouvel ouvrage",
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
                      validator: (x) => x.isEmpty || x == null
                          ? "Le code ouvrage vide"
                          : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: buildTextBox(
                      "Titre",
                      maxLines: 2,
                      controller: _titre,
                      validator: (x) =>
                          x.isEmpty || x == null ? "Le titre vide" : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: _auteur,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
                          labelText: "Auteur",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      suggestionsCallback: (pattern) {
                        return _getSuggestions(pattern, 1);
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text("${suggestion.designation}"),
                        );
                      },
                      transitionBuilder: (context, suggestionsBox, controller) {
                        return suggestionsBox;
                      },
                      onSuggestionSelected: (suggestion) {
                        this._acq.auteur = suggestion.id;
                        this._auteur.text = suggestion.designation;
                      },
                      validator: (x) => x.isEmpty || x == null
                          ? "Le nom de l'auteur vide"
                          : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: _type,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
                          labelText: "Type",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      suggestionsCallback: (pattern) {
                        return _getSuggestions(pattern, 2);
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text("${suggestion.designation}"),
                        );
                      },
                      transitionBuilder: (context, suggestionsBox, controller) {
                        return suggestionsBox;
                      },
                      onSuggestionSelected: (suggestion) {
                        this._acq.type = suggestion.id;
                        this._type.text = suggestion.designation;
                      },
                      validator: (x) => x.isEmpty || x == null
                          ? "La designation de type vide"
                          : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: _editeur,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
                          labelText: "Editeur",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      suggestionsCallback: (pattern) {
                        return _getSuggestions(pattern, 3);
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text("${suggestion.designation}"),
                        );
                      },
                      transitionBuilder: (context, suggestionsBox, controller) {
                        return suggestionsBox;
                      },
                      onSuggestionSelected: (suggestion) {
                        this._acq.editeur = suggestion.id;
                        this._editeur.text = suggestion.designation;
                      },
                      validator: (x) => x.isEmpty || x == null
                          ? "La designation de l'éditeur vide"
                          : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: _class,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
                          labelText: "Classification",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      suggestionsCallback: (pattern) {
                        return _getSuggestions(pattern, 4);
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text("${suggestion.designation}"),
                        );
                      },
                      transitionBuilder: (context, suggestionsBox, controller) {
                        return suggestionsBox;
                      },
                      onSuggestionSelected: (suggestion) {
                        this._acq.classe = suggestion.id;
                        this._class.text = suggestion.designation;
                      },
                      validator: (x) => x.isEmpty || x == null
                          ? "La classification vide"
                          : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: buildTextBox(
                      "ISBN",
                      controller: _isbn,
                      validator: (x) =>
                          x.isEmpty || x == null ? "Le numéro ISBN vide" : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 5,
                        child: buildTextBox(
                          "Publication",
                          controller: _publication,
                          inputType: TextInputType.number,
                          validator: (x) => x.isEmpty || x == null
                              ? "La publication vide"
                              : null,
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        flex: 4,
                        child: buildTextBox(
                          "Version",
                          inputType: TextInputType.number,
                          controller: _version,
                          validator: (x) =>
                              x.isEmpty || x == null ? "La version vide" : null,
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        flex: 3,
                        child: buildTextBox(
                          "Pages",
                          inputType: TextInputType.number,
                          controller: _page,
                          validator: (x) =>
                              x.isEmpty || x == null ? "Vide" : null,
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
                      _saveAcquisition();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
