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
        actions: <Widget>[IconButton(
          icon: Icon(
            Icons.event,
            size: 25.0,
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/TrackerKalenderScreen");
          },
        ),],
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
      ),
      body: ListView(
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
                headerStyle: HeaderStyle(
                  titleTextStyle: TextStyle(fontSize: 18.0,),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekendStyle: TextStyle(color: Colors.black, fontSize: 16.0,),
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
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Online Marketing",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        " | ",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      Text(
                        "Übung 5",
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                    ],
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
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Online Marketing",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        " | ",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      Text(
                        "Praktikum 4",
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                    ],
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
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Online Marketing",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        " | ",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      Text(
                        "Übung 5",
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                    ],
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
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Medienproduktion",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        " | ",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      Text(
                        "Vorlesung 5",
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                    ],
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
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Medienproduktion",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(
                        " | ",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      Text(
                        "Übung 2",
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                    ],
                  ),
                  subtitle: Text(DateTime.now().toString()),
                )),
          ),
        ],
      ),
    );
  }
}
