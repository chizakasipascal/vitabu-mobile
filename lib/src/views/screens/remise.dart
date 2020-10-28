import 'package:flutter/material.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:vitabu/src/data/api/api_repository.dart';
import 'package:vitabu/src/views/widgets/button.dart';
import 'package:vitabu/src/views/widgets/scan_button.dart';
import 'package:vitabu/src/views/widgets/text_box.dart';

class RemiseScreen extends StatefulWidget {
  const RemiseScreen({Key key}) : super(key: key);

  @override
  _RemiseScreenState createState() => _RemiseScreenState();
}

class _RemiseScreenState extends State<RemiseScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _code = TextEditingController();
  TextEditingController _titre = TextEditingController();
  TextEditingController _refEmprunt = TextEditingController();
  TextEditingController _observation = TextEditingController();

  ApiRepository _api = ApiRepository();

  var _asyncCall = false;

  void stopNFC() {
    FlutterNfcReader.stop().then((response) {
      print("XXXXXXXXXXXXXXXXXXXXXXXX STOP : ${response.status.toString()}");
    });
  }

  void _clearFields() {
    _code.clear();
    _refEmprunt.clear();
    _titre.clear();
    _observation.clear();
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

  void _saveRemise() {
    /*if (_formKey.currentState.validate()) {
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
    }*/
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
                caption: "Remise",
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
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                child: buildTextBox(
                  "Titre",
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                child: buildTextBox(
                  "Référence emprunt",
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                child: buildTextBox(
                  "Observation",
                  maxLines: 4,
                ),
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
    );
  }
}
