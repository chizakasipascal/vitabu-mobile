import 'package:flutter/material.dart';
import 'package:vitabu/src/views/widgets/button.dart';
import 'package:vitabu/src/views/widgets/scan_button.dart';
import 'package:vitabu/src/views/widgets/text_box.dart';

class RemiseScreen extends StatefulWidget {
  const RemiseScreen({Key key}) : super(key: key);

  @override
  _RemiseScreenState createState() => _RemiseScreenState();
}

class _RemiseScreenState extends State<RemiseScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
        children: [
          ScanButton(
            caption: "Remise",
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
    );
  }
}
