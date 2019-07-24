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
            TableCalendar(
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

          ],
        ),

    );
  }
}