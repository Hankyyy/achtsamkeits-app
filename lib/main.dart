import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';

import 'package:aaproto2/HomeScreen/HomeScreen.dart';
import 'package:aaproto2/KalenderScreen/KalenderScreen.dart';
import 'package:aaproto2/UbungenScreen/UbungenScreen.dart';
import 'package:aaproto2/RatgeberScreen/RatgeberScreen.dart';
import 'package:aaproto2/ZieleScreen/ZieleScreen.dart';
import 'package:aaproto2/EinstellungenScreen/EinstellungenScreen.dart';
import 'package:aaproto2/LernTimerScreen/LernTimerScreen.dart';
import 'package:aaproto2/HomeScreen/TrackerKalenderScreen.dart';


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
        "/EinstellungenScreen": (context) => EinstellungenScreen(),
        "/RatgeberScreen": (context) => RatgeberScreen(),
        "/LernTimerScreen": (context) => LernTimerScreen(),
        "/TrackerKalenderScreen": (context) => TrackerKalenderScreen(),
      },
      debugShowCheckedModeBanner: false,
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
        backgroundColor: AAThemeData.backgroundColor,
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
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
