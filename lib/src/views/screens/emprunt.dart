import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
import 'package:vitabu/src/bloc/scan/scan_bloc.dart';
import 'package:vitabu/src/views/widgets/button.dart';
import 'package:vitabu/src/views/widgets/scan_button.dart';
import 'package:vitabu/src/views/widgets/text_box.dart';

class EmpruntScreen extends StatefulWidget {
  const EmpruntScreen({Key key}) : super(key: key);

  @override
  _EmpruntScreenState createState() => _EmpruntScreenState();
}

class _EmpruntScreenState extends State<EmpruntScreen> {
  TextEditingController _code = TextEditingController();
  final List _numberList = ["Number 1", "Number 2", "Number 3", "Number 4"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentNumber;

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = List();
    for (String number in _numberList) {
      items.add(
        DropdownMenuItem(
          value: number,
          child: Text(number),
        ),
      );
    }
    return items;
  }

  void _changedDropDownItem(String selectedNumber) {
    setState(() {
      _currentNumber = selectedNumber;
    });
  }

  void stopNFC() {
    FlutterNfcReader.stop().then((response) {
      print("XXXXXXXXXXXXXXXXXXXXXXXX STOP : ${response.status.toString()}");
    });
  }

  void readNFC() {
    FlutterNfcReader.read().then((onData) {
      print("XXXXXXXXXXXXXXXXXXXXXXXX ID : ${onData.id.toString()}");
      print("XXXXXXXXXXXXXXXXXXXXXXXX CONTENT : ${onData.content.toString()}");
      print("XXXXXXXXXXXXXXXXXXXXXXXX STATUS : ${onData.status.toString()}");
    });

    /*FlutterNfcReader.onTagDiscovered().listen((onData) {
      print("XXXXXXXXXXXXXXXXXXXXXXXX ID : ${onData.id.toString()}");
      print("XXXXXXXXXXXXXXXXXXXXXXXX CONTENT : ${onData.content.toString()}");
      print("XXXXXXXXXXXXXXXXXXXXXXXX STATUS : ${onData.status.toString()}");
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: BlocProvider.of<ScanBloc>(context),
      listener: (context, state) {
        if (state is ScanReading) {
          setState(() {
            _code.text = state.content;
          });
        }
      },
      child: Container(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
          children: [
            BlocBuilder<ScanBloc, ScanState>(
              cubit: BlocProvider.of<ScanBloc>(context),
              builder: (context, state) {
                return ScanButton(
                  caption: "Emprunt",
                  onTap: () {
                    print("START SCANNNNNIING");
                    BlocProvider.of<ScanBloc>(context).add(StartScan());
                  },
                );
              },
            ),
            SizedBox(
              height: 20,
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
              ),
            ),
            SizedBox(
              height: 1,
              child: Center(
                child: Container(
                  height: 1,
                  color: Theme.of(context).cursorColor,
                ),
              ),
            ),
            SizedBox(height: 20),
            /*Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: Colors.black54,
                style: BorderStyle.solid,
                width: 0.80,
              ),
            ),
            child: DropdownButton(
              disabledHint: const Text("Numéro abonné"),
              isExpanded: true,
              value: _currentNumber,
              items: _dropDownMenuItems,
              onChanged: _changedDropDownItem,
            ),
          ),*/
            SizedBox(
              child: buildTextBox(
                "Code abonné",
                enable: false,
              ),
            ),
            SizedBox(
              height: 1,
              child: Center(
                child: Container(
                  height: 1,
                  color: Theme.of(context).cursorColor,
                ),
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
                      ),
                      SizedBox(
                        height: 1,
                        child: Center(
                          child: Container(
                            height: 1,
                            color: Theme.of(context).cursorColor,
                          ),
                        ),
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
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      size: 38,
                    ),
                    onPressed: () {},
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
    );
  }
}
