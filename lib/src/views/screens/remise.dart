import 'package:flutter/material.dart';
import 'package:vitabu/src/views/widgets/button.dart';
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
          SizedBox(
            child: buildTextBox(
              "Réf Emprunt",
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            child: buildTextBox(
              "Observation",
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
