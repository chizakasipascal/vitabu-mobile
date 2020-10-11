import 'package:flutter/material.dart';
import 'package:vitabu/src/views/widgets/button.dart';
import 'package:vitabu/src/views/widgets/scan_button.dart';
import 'package:vitabu/src/views/widgets/text_box.dart';

class AcquisitionScreen extends StatefulWidget {
  const AcquisitionScreen({Key key}) : super(key: key);

  @override
  _AcquisitionScreenState createState() => _AcquisitionScreenState();
}

class _AcquisitionScreenState extends State<AcquisitionScreen> {
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
        body: Container(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
            children: [
              ScanButton(
                caption: "Nouvel ouvrage",
                onTap: () {},
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
              SizedBox(
                child: buildTextBox(
                  "Titre",
                  maxLines: 2,
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
                  disabledHint: const Text("Auteur"),
                  isExpanded: true,
                  value: _currentNumber,
                  items: _dropDownMenuItems,
                  onChanged: _changedDropDownItem,
                ),
              ),*/
              SizedBox(
                child: buildTextBox(
                  "Auteur",
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
    );
  }
}
