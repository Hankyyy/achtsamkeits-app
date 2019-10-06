import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:ape_of_mind/Model/aufgaben.dart';
import 'package:ape_of_mind/Model/meilenstein.dart';
import 'package:ape_of_mind/BottomNavBarWidget/BottomNavBarWidget.dart';
import 'package:ape_of_mind/BottomNavBarWidget/BottomNavBarWidgetBloc.dart';

import 'ZieleUtils.dart';
import 'ZieleScreen.dart';
import 'AddAufgabeScreen.dart';
import 'EditMeilensteinScreen.dart';

class ZielCard extends StatefulWidget {
  ZielCard(this.meilenstein, this.i, this.length);

  final Meilenstein_db meilenstein;
  final int i;
  final int length;

  @override
  _ZielCardState createState() => _ZielCardState(meilenstein, i, length);
}

class _ZielCardState extends State<ZielCard> {
  _ZielCardState(this.meilenstein, this.i, this.length);

  Aufgaben aufgabe = new Aufgaben();

  double borderThickness = 1;

  Meilenstein_db meilenstein;
  int i;
  int length;
  double lastPercent;

  DateTime selectedDate = DateTime.now();
  DateTime deadlineDate = DateTime.now();

  //final msTitel = TextEditingController();
  final msNotiz = TextEditingController();

  int _getPadding(int i, int length) {
    if (i != length - 1)
      return 0;
    else
      return 75;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: _getPadding(i, length).toDouble()),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.only(
                  top: 10.0, left: 15.0, bottom: 10, right: 12.5),
              title: Text(
                meilenstein.titel,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Erledigen bis: " + datumDrehen(meilenstein.datum),
                    style: Theme.of(context).textTheme.body2,
                  ),
                  Text(
                    "Deadline: " + datumDrehen(meilenstein.deadline),
                    style: Theme.of(context).textTheme.body2,
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.mode_edit,
                      size: 28,
                      color: Theme.of(context).textTheme.title.color,
                    ),
                    tooltip: "Meilenstein bearbeiten",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditMeilensteinScreen(meilenstein)));
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 40,
                      color: Theme.of(context).textTheme.title.color,
                    ),
                    tooltip: "Neue Aufgabe hinzufügen",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddAufgabeScreen(meilenstein.titel)));
                    },
                  ),
                ],
              ),
            ),
            _getNotizen(),
            SizedBox(
              height: 15,
            ),
            FutureBuilder<List<Aufgaben>>(
              future: aufgabe.aufgabenMSdone(meilenstein.titel),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return LinearPercentIndicator(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    lineHeight: 15,
                    backgroundColor: Theme.of(context).highlightColor,
                    progressColor: Theme.of(context).primaryColor,
                    percent: 0,
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error!"),
                  );
                }

                List<Aufgaben> erledigt = snapshot.data ?? [];

                return FutureBuilder<List<Aufgaben>>(
                  future: aufgabe.aufgabenMSnotdone(meilenstein.titel),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return LinearPercentIndicator(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        animation: true,
                        lineHeight: 15,
                        backgroundColor: Theme.of(context).highlightColor,
                        progressColor: Theme.of(context).primaryColor,
                        percent: 0,
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error!"),
                      );
                    }

                    List<Aufgaben> unErledigt = snapshot.data ?? [];

                    lastPercent = erledigt.length / (unErledigt.length + erledigt.length);

                    return LinearPercentIndicator(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      animation: true,
                      animationDuration: 200,
                      lineHeight: 15,
                      backgroundColor: Theme.of(context).highlightColor,
                      progressColor: Theme.of(context).primaryColor,
                      percent: erledigt.length /
                          (unErledigt.length + erledigt.length),

                      animateFromLastPercent: true,
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            FutureBuilder<List<Aufgaben>>(
              future: aufgabe.aufgabenMSnotdone(meilenstein.titel),
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
                    return Center(
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
                          "Erledigen bis: " +
                              datumDrehen(snapshot.data[index].datum),
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            FutureBuilder<List<Aufgaben>>(
              future: aufgabe.aufgabenMSdone(meilenstein.titel),
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
              return Center(
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

  Widget _getNotizen() {
    if (meilenstein.notizen.isEmpty)
      return Container();
    else
      return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(bottom: 15, left: 15),
        child: Text(
          meilenstein.notizen,
          style: Theme.of(context).textTheme.subtitle,
        ),
      );
  }
}

String datumDrehen(String datum) {
  var getrennt = datum.split(".");
  return getrennt[2] + "." + getrennt[1] + "." + getrennt[0];
}
