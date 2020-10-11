import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: Colors.grey,
  primarySwatch: Colors.grey,
  splashColor: Colors.grey[300],
  cursorColor: Colors.black87,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.grey,
    splashColor: Colors.grey[300],
    foregroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    headline6: TextStyle(color: Colors.black54),
  ),
  iconTheme: IconThemeData(
    color: Colors.black38,
  ),
  buttonColor: Colors.grey[500],
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0.3,
  ),
);
