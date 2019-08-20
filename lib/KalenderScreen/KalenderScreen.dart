import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class KalenderScreen extends StatefulWidget {
  @override
  _KalenderScreenState createState() => _KalenderScreenState();
}

class _KalenderScreenState extends State<KalenderScreen> {
  int test;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('de_DE');
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kalender',
          style: TextStyle(fontSize: 30.0),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.today,
              size: 25.0,
            ),
            tooltip: "Heute",
            onPressed: () {
              setState(() {
                _calendarController.setSelectedDay(DateTime.now(),
                    runCallback: true);
              });
            },
          ),
        ],
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
                calendarController: _calendarController,
                locale: 'de_DE',
                startingDayOfWeek: StartingDayOfWeek.monday,
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Month',
                },
                headerStyle: HeaderStyle(
                  titleTextStyle: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekendStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
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
                        "Übung 5",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "Online Marketing",
                    style: TextStyle(
                        //fontSize: 16.0
                        ),
                  ),
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
                        "Praktikum 4",
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "Online Marketing",
                    //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                )),
          ),
          //Text(DateTime.now().day.toString()),
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
                        "Übung 5",
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "Online Marketing",
                    //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
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
                        "Vorlesung 5",
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "Medienproduktion",
                    //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
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
                        "Übung 2",
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "Medienproduktion",
                    //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

//Text(DateTime.now().toString()),
