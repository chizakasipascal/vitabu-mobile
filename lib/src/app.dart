import 'package:flutter/material.dart';

import 'views/screens/home.dart';
import 'views/screens/login.dart';

class VitabuApp extends StatelessWidget {
  final Widget _defaultPage = LoginScreen();

  VitabuApp({Key key}) : super(key: key);

  final _routes = <String, WidgetBuilder>{
    LoginScreen.tag: (context) => LoginScreen(),
    HomeScreen.tag: (context) => HomeScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vitabu',
      home: _defaultPage,
      initialRoute: '/',
      routes: _routes,
    );
  }
}
