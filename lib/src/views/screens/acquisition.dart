import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:vitabu/src/data/api/api_repository.dart';
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

  var _listAuteur;
  var _listType;
  var _listEditeur;
  var _listClass;
  var _asyncCall = false;

  List<dynamic> _getSuggestions(String query, int case) {
    List<dynamic> matches = List<dynamic>();
    //matches.addAll(_listAbonnes);
    matches.retainWhere((e) =>
    (e.nom.toLowerCase().contains(query.toLowerCase()) ||
        e.postnom.toLowerCase().contains(query.toLowerCase())));
    return matches;
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
          child: Container(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
              children: [
                ScanButton(
                  caption: "Nouvel ouvrage",
                  onTap: () {},
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
                        labelText: "Titre",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    suggestionsCallback: (pattern) {
                      return _getSuggestions(pattern, 1);
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text("${suggestion.numero}"),
                      );
                    },
                    transitionBuilder: (context, suggestionsBox, controller) {
                      return suggestionsBox;
                    },
                    onSuggestionSelected: (suggestion) {
                      
                      this._titre.text = suggestion.numero;
                    },
                    validator: (x) =>
                    x.isEmpty || x == null ? "Le code abonné vide" : null,
                  ),
                ),
                SizedBox(
                  child: buildTextBox(
                    "Auteur",
                    controller: _code,
                    validator: (x) =>
                    x.isEmpty || x == null ? "Le code ouvrage vide" : null,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  child: buildTextBox(
                    "Type",
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  child: buildTextBox(
                    "Editeur",
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  child: buildTextBox(
                    "Classification",
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  child: buildTextBox(
                    "ISBN",
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
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      flex: 4,
                      child: buildTextBox(
                        "Version",
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      flex: 3,
                      child: buildTextBox(
                        "Page",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Button(
                  caption: "VALIDER",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
