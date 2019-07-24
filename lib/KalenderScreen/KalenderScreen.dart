import 'package:flutter/material.dart';


import 'package:aaproto2/ThemeData.dart';
import 'package:table_calendar/table_calendar.dart';


class KalenderScreen extends StatefulWidget {
  @override
  _KalenderScreenState createState() => _KalenderScreenState();
}

class _KalenderScreenState extends State<KalenderScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalender', style: TextStyle(fontSize: 30.0),),
        actions: <Widget>[

        ],
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
      ),
      body: ListView(
          //padding: EdgeInsets.symmetric(horizontal: 10.0),
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TableCalendar(
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month',
                  },
                  calendarStyle: CalendarStyle(
                    selectedColor: AAThemeData.primaryColor,
                    todayColor: AAThemeData.accentColor,
                    markersColor: Colors.brown[700],
                  ),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: Text("Online Marketing | Übung 5", style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(DateTime.now().toString()),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: Text("Online Marketing | Praktikum 4", style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(DateTime.now().toString()),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: Text("Medienproduktion | Vorlesung 9", style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(DateTime.now().toString()),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: Text("Medienproduktion | Übung 2", style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(DateTime.now().toString()),
                ),
              ),
            ),
          ],
        ),

    );
  }
}