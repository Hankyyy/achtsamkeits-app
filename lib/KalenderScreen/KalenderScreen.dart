import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';
import 'package:table_calendar/table_calendar.dart';

class KalenderScreen extends StatefulWidget {
  @override
  _KalenderScreenState createState() => _KalenderScreenState();
}

class _KalenderScreenState extends State<KalenderScreen> {
  int test;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kalender',
          style: TextStyle(fontSize: 30.0),
        ),
        actions: <Widget>[],
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
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekendStyle: TextStyle(color: Colors.black),
                ),
                calendarStyle: CalendarStyle(
                  selectedColor: AAThemeData.primaryColor,
                  todayColor: AAThemeData.accentColor,
                  markersColor: Colors.brown[700],
                  weekdayStyle: TextStyle(color: Colors.black54),
                  weekendStyle: TextStyle(color: Colors.black87),
                  outsideStyle: TextStyle(color: Colors.black26),
                  outsideWeekendStyle: TextStyle(color: Colors.black38),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: CheckboxListTile(
                  value: false,
                  onChanged: (bool newvalue) {},
                  title: Text(
                    "Online Marketing | Übung 5",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(DateTime.now().toString()),
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: CheckboxListTile(
                  value: false,
                  onChanged: (bool newvalue) {},
                  title: Text(
                    "Online Marketing | Praktikum 4",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(DateTime.now().toString()),
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: CheckboxListTile(
                  value: false,
                  onChanged: (bool newvalue) {},
                  title: Text(
                    "Medienproduktion | Vorlesung 9",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(DateTime.now().toString()),
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: CheckboxListTile(
                  value: false,
                  onChanged: (bool newvalue) {},
                  title: Text(
                    "Medienproduktion | Übung 2",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(DateTime.now().toString()),
                )),
          ),
        ],
      ),
    );
  }
}
