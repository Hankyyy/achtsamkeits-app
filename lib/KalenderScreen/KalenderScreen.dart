import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ape_of_mind/Model/aufgaben.dart';

class KalenderScreen extends StatefulWidget {
  @override
  _KalenderScreenState createState() => _KalenderScreenState();
}

class _KalenderScreenState extends State<KalenderScreen> {
  Map<DateTime, List> _events2 = Map();
  Map<DateTime, List> _events = Map();
  List _selectedEvents;
  DateTime _selectedDay = DateTime.now();
  final CalendarController _calendarController = CalendarController();
  final Aufgaben af = Aufgaben();

  String datum;

  /*= "${DateTime.now().year.toString()}" +
      "."
          "${DateTime.now().month.toString()}" +
      "."
          "${DateTime.now().day.toString()}";*/

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

      if (day.day < 10 && day.month < 10) {
        datum = ("${day.year.toString()}" +
            ".0"
                "${day.month.toString()}" +
            ".0"
                "${day.day.toString()}");
      } else if (day.day < 10) {
        datum = ("${day.year.toString()}" +
            "."
                "${day.month.toString()}" +
            ".0"
                "${day.day.toString()}");
      } else if (day.month < 10) {
        datum = ("${day.year.toString()}" +
            ".0"
                "${day.month.toString()}" +
            "."
                "${day.day.toString()}");
      } else {
        datum = ("${day.year.toString()}" +
            "."
                "${day.month.toString()}" +
            "."
                "${day.day.toString()}");
      }
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('de_DE');
    if (DateTime.now().day < 10 && DateTime.now().month < 10) {
      datum = ("${DateTime.now().year.toString()}" +
          ".0"
              "${DateTime.now().month.toString()}" +
          ".0"
              "${DateTime.now().day.toString()}");
    } else if (DateTime.now().day < 10) {
      datum = ("${DateTime.now().year.toString()}" +
          "."
              "${DateTime.now().month.toString()}" +
          ".0"
              "${DateTime.now().day.toString()}");
    } else if (DateTime.now().month < 10) {
      datum = ("${DateTime.now().year.toString()}" +
          ".0"
              "${DateTime.now().month.toString()}" +
          "."
              "${DateTime.now().day.toString()}");
    } else {
      datum = ("${DateTime.now().year.toString()}" +
          "."
              "${DateTime.now().month.toString()}" +
          "."
              "${DateTime.now().day.toString()}");
    }
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
      body: FutureBuilder(
        future: af.aufgabenNotDone(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container();
          }
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          if (snapshot.hasData) {
            _events = snapshot.data;
            _selectedEvents = _events[_selectedDay] ?? [];

            _events = snapshot.data;
            return ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TableCalendar(
                      calendarController: _calendarController,
                      events: _events,
                      locale: 'de_DE',
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Month',
                      },
                      availableGestures: AvailableGestures.horizontalSwipe,
                      initialSelectedDay: DateTime.now(),
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
                        markersColor: Colors.grey,
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
                      onVisibleDaysChanged: _onVisibleDaysChanged,
                      builders: CalendarBuilders(
                        markersBuilder: (context, date, events, holidays) {
                          final children = <Widget>[];

                          if (events.isNotEmpty) {
                            children.add(
                              Positioned(
                                right: 1,
                                bottom: 1,
                                child: _buildEventsMarker(date, _events[date]),
                              ),
                            );
                            return children;
                          } else {
                            children.add(Container());
                            return children;
                          }
                        },
                      ),
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
                      builder: (context, snapshot2) {
                        if (snapshot2.connectionState != ConnectionState.done) {
                          return Container();
                        }
                        if (snapshot2.hasError) {
                          return Center(
                            child: Text("Error!"),
                          );
                        }
                        List<Aufgaben> aufgaben = snapshot2.data ?? [];
                        Aufgaben af = Aufgaben();
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot2.data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(
                                  left: 12.5,
                                  right: 12.5,
                                  bottom: _getPadding(
                                      index, snapshot2.data.length)),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: CheckboxListTile(
                                  value:
                                      isChecked(snapshot2.data[index].erledigt),
                                  onChanged: (bool value) {
                                    setState(
                                      () {
                                        changeCheck(
                                            snapshot2.data[index].titel,
                                            snapshot2
                                                .data[index].meilenstein_id,
                                            snapshot2.data[index].erledigt);
                                      },
                                    );
                                  },
                                  title: Text(
                                    snapshot2.data[index].titel,
                                    style: Theme.of(context).textTheme.body2,
                                  ),
                                  subtitle: Text(
                                    snapshot2.data[index].meilenstein_id,
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
                      builder: (context, snapshot3) {
                        if (snapshot3.connectionState != ConnectionState.done) {
                          return Container();
                        }
                        if (snapshot3.hasError) {
                          return Center(
                            child: Text("Error!"),
                          );
                        }
                        List<Aufgaben> aufgaben = snapshot3.data ?? [];
                        Aufgaben af = Aufgaben();
                        return getErledigteAufgaben(snapshot3);
                      },
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    events = _events[date];
    if (events == null)
      return Container();
    else
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _calendarController.isSelected(date)
              ? Theme.of(context).highlightColor
              : Theme.of(context).primaryColor,
        ),
        width: 16.0,
        height: 16.0,
        child: Center(
          child: Text(
            '${_events[date].length}',
            style: TextStyle().copyWith(
              color: Theme.of(context).accentTextTheme.title.color,
              fontSize: 12.0,
            ),
          ),
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
