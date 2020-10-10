import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String tag = "home";
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
        title: Text("Vitabu"),       
      ),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }
}