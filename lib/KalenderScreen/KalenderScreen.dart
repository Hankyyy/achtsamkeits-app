import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ape_of_mind/Model/aufgaben.dart';

class KalenderScreen extends StatefulWidget {
  @override
  _KalenderScreenState createState() => _KalenderScreenState();
}

class _KalenderScreenState extends State<KalenderScreen> {
  int test;
  Map<DateTime, List> _events;
  List _selectedEvents;
  CalendarController _calendarController;
  Aufgaben af = Aufgaben();

  String datum = "${DateTime.now().year.toString()}" +
      "."
          "${DateTime.now().month.toString()}" +
      "."
          "${DateTime.now().day.toString()}";

  double _getPadding(int i, int length) {
    if (i != length - 1)
      return 0;
    else
      return 15;
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
      datum = "${day.year.toString()}" +
          "."
              "${day.month.toString()}" +
          "."
              "${day.day.toString()}";
    });
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('de_DE');
    _calendarController = CalendarController();

    final _selectedDay = DateTime.now();

    //_events = [];

    //_selectedEvents = _events[_selectedDay] ?? [];
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
              child: FutureBuilder(
                future: af.aufgabenNotDone(),
                builder: (context, snapshot) {


                  _events = snapshot.data;
                  //_selectedEvents = _events[DateTime.now()] ?? [];


                  return TableCalendar(
                    calendarController: _calendarController,
                    events: _events,
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
                      markersColor: Theme.of(context).textTheme.title.color,
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
                    onDaySelected: _onDaySelected,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Column(
            children: <Widget>[
              FutureBuilder<List<Aufgaben>>(
                future: af.aufgabenDatumNotdone(datum),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Container();
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error!"),
                    );
                  }
                  List<Aufgaben> aufgaben = snapshot.data ?? [];
                  Aufgaben af = new Aufgaben();
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(
                            left: 12.5,
                            right: 12.5,
                            bottom: _getPadding(index, snapshot.data.length)),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: CheckboxListTile(
                            value: isChecked(snapshot.data[index].erledigt),
                            onChanged: (bool value) {
                              setState(
                                () {
                                  changeCheck(
                                      snapshot.data[index].titel,
                                      snapshot.data[index].meilenstein_id,
                                      snapshot.data[index].erledigt);
                                },
                              );
                            },
                            title: Text(
                              snapshot.data[index].titel,
                              style: Theme.of(context).textTheme.body2,
                            ),
                            subtitle: Text(
                              snapshot.data[index].meilenstein_id,
                              style: Theme.of(context).textTheme.subtitle,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              FutureBuilder<List<Aufgaben>>(
                future: af.aufgabenDatumDone(datum),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Container();
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error!"),
                    );
                  }
                  List<Aufgaben> aufgaben = snapshot.data ?? [];
                  Aufgaben af = Aufgaben();
                  return getErledigteAufgaben(snapshot);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget getErledigteAufgaben(var snapshot) {

    if (snapshot.data.length != 0)
      return ExpansionTile(
        title: Text(
          "Erledigte Aufgaben",
          style: Theme.of(context).textTheme.body1,
        ),
        children: <Widget>[
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(
                    left: 12.5,
                    right: 12.5,
                    bottom: _getPadding(index, snapshot.data.length)),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: CheckboxListTile(
                    value: isChecked(snapshot.data[index].erledigt),
                    onChanged: (bool value) {
                      setState(
                        () {
                          changeCheck(
                              snapshot.data[index].titel,
                              snapshot.data[index].meilenstein_id,
                              snapshot.data[index].erledigt);
                        },
                      );
                    },
                    title: Text(
                      snapshot.data[index].titel,
                      style: Theme.of(context).textTheme.body2,
                    ),
                    subtitle: Text(
                      snapshot.data[index].meilenstein_id,
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      );
    else
      return Container();
  }

  bool isChecked(int i) {
    if (i == 0) {
      return false;
    } else {
      return true;
    }
  }

  bool changeCheck(String titel, String meilenstein_id, int erledigt) {
    Aufgaben af = new Aufgaben();
    af.checkAF(titel, meilenstein_id, erledigt);
  }

}
