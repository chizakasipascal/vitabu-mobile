import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:vitabu/src/utils/color.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double screenHeight, screenWidth;
  bool _log = false;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: _buildBody(),
    );
  }

  var logo = Column(
    children: <Widget>[
      //TODO: Add application logo
      /*
      Image.asset(
        'assets/img/logo.png',
        width: 200.0,
        height: 180.0,
      ),
      */
    ],
  );

  var butonBar = Center(
    child: ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 250.0,
          child: FlatButton(
            //TODO: Define application colors
            //highlightColor: SecondaryColor,
            //textColor: WhiteColor,
            child: Text("Conditions d'utilisation"),
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            onPressed: () {},
          ),
        )
      ],
    ),
  );

  Widget _buildBody() {
    return Scaffold(
      body: ModalProgressHUD(
        child: ListView(
          children: <Widget>[],
        ),
        inAsyncCall: _log,
      ),
    );
  }
}
