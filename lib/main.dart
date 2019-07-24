import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';

import 'package:aaproto2/HomeScreen/HomeScreen.dart';
import 'package:aaproto2/KalenderScreen/KalenderScreen.dart';
import 'package:aaproto2/UbungenScreen/UbungenScreen.dart';
import 'package:aaproto2/UbungenScreen/UbungenDetailScreen.dart';
import 'package:aaproto2/ZieleScreen/ZieleScreen.dart';
import 'package:aaproto2/EinstellungenScreen/EinstellungenScreen.dart';
import 'package:aaproto2/ZieleScreen/NeuerMeilensteinScreen.dart';
import 'package:aaproto2/ZieleScreen/NeueAufgabeScreen.dart';
import 'package:aaproto2/LernTimerScreen/LernTimerScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'APE - FH';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: BottomNavBarWidget(),
      theme: AAThemeData,
      routes: {
        "/EinstellungenScreen" :(context) => EinstellungenScreen(),
        "/NeuerMeilensteinScreen" : (context) => NeuerMeilensteinScreen(),
        "/NeueAufgabeScreen" : (context) => NeueAufgabeScreen(),

        //"/UbungenDetailScreen" : (context) => UbungenDetailScreen(),
        "/LernTimerScreen" : (context) => LernTimerScreen(),
      },
    );
  }
}

class BottomNavBarWidget extends StatefulWidget {
  BottomNavBarWidget({Key key}) : super(key: key);

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    KalenderScreen(),
    UbungenScreen(),
    ZieleScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AAThemeData.primaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Kalender'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('Übungen'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            title: Text('Ziele'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: AAThemeData.backgroundColor,
        unselectedItemColor: AAThemeData.buttonColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
