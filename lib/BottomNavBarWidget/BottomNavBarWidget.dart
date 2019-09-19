import 'package:flutter/material.dart';

import 'BottomNavBarWidgetBloc.dart';
import 'package:ape_of_mind/HomeScreen/HomeScreen.dart';
import 'package:ape_of_mind/KalenderScreen/KalenderScreen.dart';
import 'package:ape_of_mind/UbungenScreen/UbungenScreen.dart';
import 'package:ape_of_mind/ZieleScreen/ZieleScreen.dart';

class BottomNavBarWidget extends StatefulWidget {
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  BottomNavBarBloc _bottomNavBarBloc;

  @override
  void initState() {
    super.initState();
    _bottomNavBarBloc = BottomNavBarBloc();
  }

  @override
  void dispose() {
    _bottomNavBarBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<BottomNavBarItem>(
        stream: _bottomNavBarBloc.navBarStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder:
            (BuildContext context, AsyncSnapshot<BottomNavBarItem> snapshot) {
          switch (snapshot.data) {
            case BottomNavBarItem.Home:
              return HomeScreen();
            case BottomNavBarItem.Kalender:
              return KalenderScreen();
            case BottomNavBarItem.Ubungen:
              return UbungenScreen();
            case BottomNavBarItem.Ziele:
              return ZieleScreen();
          }
        },
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavBarBloc.navBarStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder:
            (BuildContext context, AsyncSnapshot<BottomNavBarItem> snapshot) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: snapshot.data.index,
            onTap: _bottomNavBarBloc.pickItem,
            fixedColor: Theme.of(context).primaryColor,
            selectedFontSize: 14,
            unselectedItemColor: Theme.of(context).bottomAppBarColor,
            //showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                title: Text('Home'),
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                title: Text('Kalender'),
                icon: Icon(Icons.calendar_today),
              ),
              BottomNavigationBarItem(
                title: Text('Übungen'),
                icon: Icon(Icons.assignment),
              ),
              BottomNavigationBarItem(
                title: Text('Ziele'),
                icon: Icon(Icons.flag),
              ),
            ],
          );
        },
      ),
    );
  }
}
