import 'package:flutter/material.dart';
import 'package:vitabu/src/views/widgets/button.dart';
import 'package:vitabu/src/views/widgets/text_box.dart';

class EmpruntScreen extends StatefulWidget {
  const EmpruntScreen({Key key}) : super(key: key);

  @override
  _EmpruntScreenState createState() => _EmpruntScreenState();
}

class _EmpruntScreenState extends State<EmpruntScreen> {
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
    return Container(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
        children: [
          SizedBox(
            child: buildTextBox(
              "Code RFID",
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
              disabledHint: const Text("Numéro abonné"),
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
                flex: 2,
                child: buildTextBox(
                  "Quantité",
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
  }
}
