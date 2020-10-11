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
      BottomNavigationBarItem(
        label: "Emprunt",
        icon: Icon(Icons.outbond_sharp),
      ),
      BottomNavigationBarItem(
        label: "Remise",
        icon: Icon(Icons.move_to_inbox),
      ),
    ];

    assert(_tabPages.length == _bottomNavBarItems.length);

    final _bottomNavBar = BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: BottomNavigationBar(
        items: _bottomNavBarItems,
        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
      ),
    );

    final _floatingButton = FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.pushNamed(
          context,
          Routes.acquisition,
        );
      },
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "VITABU",
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    child: FlatButton(
                      child: const Text("Déconnection"),
                      onPressed: () => Navigator.pushReplacementNamed(
                        context,
                        Routes.login,
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    child: Text("A propos"),
                  ),
                  PopupMenuItem<String>(
                    child: Text("Aide"),
                  )
                ];
              },
            ),
          ],
        ),
        body: _tabPages[_currentTabIndex],
        bottomNavigationBar: _bottomNavBar,
        floatingActionButton: _floatingButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
