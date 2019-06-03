import 'package:flutter/material.dart';
import 'home.dart';
import 'calendar.dart';
import 'tasks.dart';
import 'goals.dart';



void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
 // static const TextStyle optionStyle = TextStyle(fontSize: 40, fontWeight: FontWeight.bold); //index anzeige
  String myTitle='Achtsamkeit'; //Title
  static const TextStyle iconStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold); //icon anzeige
  int _selectedPage = 0;
  static const primcolor = const Color(0xffb2ebf2);

  final _pageOptions = [ //array
    Home(),
    Calendar(),
    Tasks(),
    Goals()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       primaryColor: primcolor,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text((myTitle),
          style: TextStyle(color: Colors.blueGrey),),

        ),
        body: _pageOptions[_selectedPage], //was wir displayen wollen

        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: primcolor,//Colors.cyan[100],
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.indigo,
              textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.blueGrey))),

          child: new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedPage,
            onTap: (int index){
              setState(() {
                _selectedPage = index;

                switch(_selectedPage){
                  case 0:
                    myTitle='Home';
                    break;
                  case 1:
                    myTitle='Kalendar';
                    break;
                  case 2:
                    myTitle='Übungen';
                    break;
                  case 3:
                    myTitle='Ziele';
                    break;
                }

              });
             },

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 35.0),
              title: Text('Home', style: iconStyle),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.date_range, size: 35.0),
              title: Text('Kalendar', style: iconStyle),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted, size: 35.0),
              title: Text('Übungen', style: iconStyle),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flag, size: 35.0),
              title: Text('Ziele', style: iconStyle),
            ),
          ],
          ),
        ),
      ),
    );
  }
}






