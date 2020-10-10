import 'package:flutter/material.dart';
import 'package:vitabu/src/constants/routes.dart';

import 'emprunt.dart';
import 'remise.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _tabPages = <Widget>[EmpruntScreen(), RemiseScreen()];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(label: "Emprunt", icon: null),
      BottomNavigationBarItem(label: "Remise", icon: null),
    ];

    assert(_tabPages.length == _bottomNavBarItems.length);

    final _bottomNavBar = BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );

    final _floatingButton = FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.acquisition);
      },
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("VITABU"),
          actions: <Widget>[],
        ),
        body: _tabPages[_currentTabIndex],
        bottomNavigationBar: _bottomNavBar,
        floatingActionButton: _floatingButton,
      ),
    );
  }
}
