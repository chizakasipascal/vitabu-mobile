import 'package:flutter/material.dart';
import 'package:vitabu/src/views/screens/index.dart';

class Routes {
  Routes._();

  static const String login = "/login";
  static const String home = "/home";
  static const String emprunt = "/emprunt";
  static const String remise = "/remise";
  static const String acquisition = "/acquisition";

  static final routesList = <String, WidgetBuilder>{
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    emprunt: (BuildContext context) => EmpruntScreen(),
    remise: (BuildContext context) => RemiseScreen(),
    acquisition: (BuildContext context) => AcquisitionScreen()
  };
}
