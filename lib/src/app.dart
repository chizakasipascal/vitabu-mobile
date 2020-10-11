import 'package:flutter/material.dart';

import 'constants/routes.dart';
import 'constants/theme.dart';
import 'views/screens/login.dart';

class VitabuApp extends StatelessWidget {
  final Widget _defaultPage = LoginScreen();

  VitabuApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      title: 'Vitabu',
      home: _defaultPage,
      routes: Routes.routesList,
    );
  }
}
