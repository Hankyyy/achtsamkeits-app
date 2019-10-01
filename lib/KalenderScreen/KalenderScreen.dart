import 'package:flutter/material.dart';

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
          style: TextStyle(
              fontSize: 30.0, color: Theme.of(context).textTheme.title.color),
        ),
        backgroundColor: Theme.of(context).appBarTheme.color,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.today,
              size: 25.0,
            ),
            color: Theme.of(context).textTheme.title.color,
            tooltip: "Heute",
            onPressed: () {
              setState(
                () {
                  _calendarController.setSelectedDay(DateTime.now(),
                      runCallback: true);
                },
              );
            },
          ),
        ],
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.5),
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
                  titleTextStyle: Theme.of(context).textTheme.title,
                  leftChevronIcon: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).textTheme.title.color,
                    size: 17.5,
                  ),
                  rightChevronIcon: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).textTheme.title.color,
                    size: 17.5,
                  ),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: Theme.of(context).textTheme.body1,
                  weekendStyle: Theme.of(context).textTheme.body1,
                ),
                calendarStyle: CalendarStyle(
                  todayStyle: Theme.of(context).accentTextTheme.body2,
                  selectedStyle: Theme.of(context).accentTextTheme.title,
                  selectedColor: Theme.of(context).primaryColor,
                  todayColor: Theme.of(context).highlightColor,
                  markersColor: Colors.brown[700],
                  weekdayStyle: Theme.of(context).textTheme.caption,
                  weekendStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  outsideStyle: Theme.of(context).textTheme.overline,
                  outsideWeekendStyle: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: CheckboxListTile(
                value: false,
                onChanged: (bool newValue) {},
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Übung 5",
                      style: Theme.of(context).textTheme.title,
                    ),
                  ],
                ),
                subtitle: Text(
                  "Online Marketing",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.5),
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
                      style: Theme.of(context).textTheme.title,
                    ),
                  ],
                ),
                subtitle: Text(
                  "Online Marketing",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
          ),
          //Text(DateTime.now().day.toString()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.5),
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
                      style: Theme.of(context).textTheme.title,
                    ),
                  ],
                ),
                subtitle: Text(
                  "Online Marketing",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.5),
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
                      style: Theme.of(context).textTheme.title,
                    ),
                  ],
                ),
                subtitle: Text(
                  "Medienproduktion",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: CheckboxListTile(
                value: false,
                onChanged: (bool newvalue) {},
                title: Text(
                  "Übung 2",
                  style: Theme.of(context).textTheme.title,
                ),
                subtitle: Text(
                  "Medienproduktion",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12.5,
          ),
        ],
      ),
    );
  }
}

//Text(DateTime.now().toString()),
