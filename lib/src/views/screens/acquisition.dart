import 'package:flutter/material.dart';

class AcquisitionScreen extends StatelessWidget {
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
              SizedBox(
                child: buildTextBox(
                  "Code RFID",
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                child: buildTextBox(
                  "Titre",
                ),
              ),
              SizedBox(height: 16),
              Container(
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
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 4,
                    child: buildTextBox(
                      "Publication",
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: buildTextBox(
                      "Version",
                    ),
                  ),
                  SizedBox(width: 10),
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
        );
      ),
    );
  }
}
