import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:ape_of_mind/Model/aufgaben.dart';
import 'package:ape_of_mind/Model/meilenstein.dart';


import 'ZieleUtils.dart';
import 'AddAufgabeScreen.dart';

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

  bool view = true;

  DateTime selectedDate = DateTime.now();
  DateTime deadlineDate = DateTime.now();

  //final msTitel = TextEditingController();
  final msNotiz = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<Null> _deadlineDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: deadlineDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != deadlineDate)
      setState(() {
        deadlineDate = picked;
      });
  }

  int _getPadding(int i, int length) {
    if (i != length - 1)
      return 0;
    else
      return 75;
  }

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 3),
      content: SizedBox(
        height: 1,
      ),
      action: SnackBarAction(
        label: "Rückängig machen",
        onPressed: () {
          null;
        },
        textColor: Theme.of(context).textTheme.title.color,
      ),
      backgroundColor: Theme.of(context).highlightColor,
    );

    if (!view)
      return Container(
        padding: EdgeInsets.only(
          bottom: _getPadding(i, length).toDouble(),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Theme.of(context).primaryColor,
              width: borderThickness,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(borderThickness),
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(
                        top: 10.0, left: 15.0, bottom: 10, right: 12.5),
                    title: Text(
                      meilenstein.titel,
                      style: Theme.of(context).textTheme.title,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            size: 30,
                            color: Theme.of(context).textTheme.title.color,
                          ),
                          tooltip: "Meilenstein löschen",
                          onPressed: () {
                            _meilenSteinLoschenDialog();
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Erledigen bis:',
                              style: Theme.of(context).textTheme.body2,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            OutlineButton(
                              onPressed: () => _selectDate(context),
                              highlightedBorderColor:
                                  Theme.of(context).primaryColor,
                              child: Text("${selectedDate.day.toString()}" +
                                  "."
                                      "${selectedDate.month.toString()}" +
                                  "."
                                      "${selectedDate.year.toString()}"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Deadline:',
                              style: Theme.of(context).textTheme.body2,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            OutlineButton(
                              onPressed: () => _deadlineDate(context),
                              highlightedBorderColor:
                                  Theme.of(context).primaryColor,
                              child: Text("${deadlineDate.day.toString()}" +
                                  "."
                                      "${deadlineDate.month.toString()}" +
                                  "."
                                      "${deadlineDate.year.toString()}"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: msNotiz,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          //initialValue: meilenstein.notizen,
                          decoration: InputDecoration(
                            labelText: "Notizen",
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(),
                            ), //fillColor: Colors.green
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  ExpansionTile(
                    title: Text(
                      "Aufgaben",
                      style: Theme.of(context).textTheme.body1,
                    ),
                    children: <Widget>[
                      FutureBuilder<List<Aufgaben>>(
                        //future: aufgabenMS(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done) {
                            return Center(child: CircularProgressIndicator(),);
                          }
                          if (snapshot.hasError) {
                            return Center(child: Text("Error!"),);
                          }
                          List<Aufgaben> aufgaben = snapshot.data ?? [];
                          Aufgaben af = new Aufgaben();
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: aufgaben.length,
                            itemBuilder: (context, index) {
                              return Center(
                                child: ListTile(
                                  title: Text(
                                    aufgaben[index].titel,
                                    style: Theme.of(context).textTheme.body2,
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      size: 25,
                                      color: Theme.of(context)
                                          .textTheme
                                          .title
                                          .color,
                                    ),
                                    tooltip: "Aufgabe löschen",
                                    onPressed: () {
                                      Scaffold.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        color: Theme.of(context).buttonColor,
                        child: Text(
                          "Abbrechen",
                          style: Theme.of(context).textTheme.body2,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              view = true;
                            },
                          );
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Text(
                          "Bestätigen",
                          style: Theme.of(context).accentTextTheme.body2,
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: () async {
                          Meilenstein_db ms = Meilenstein_db();
                          await ms.updateMS(meilenstein.titel, "${selectedDate.day.toString()}" +
                              "."
                                  "${selectedDate.month.toString()}" +
                              "."
                                  "${selectedDate.year.toString()}", "${deadlineDate.day.toString()}" +
                              "."
                                  "${deadlineDate.month.toString()}" +
                              "."
                                  "${deadlineDate.year.toString()}", msNotiz.text);
                          setState(
                            () {

                              view = true;
                            },
                          );
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    else
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
                      "Erledigen bis: " + meilenstein.datum,
                      style: Theme.of(context).textTheme.body2,
                    ),
                    Text(
                      "Deadline: " + meilenstein.deadline,
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
                        setState(
                          () {
                            view = false;
                          },
                        );
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
              /*LinearPercentIndicator(
                padding: EdgeInsets.symmetric(horizontal: 25),
                lineHeight: 15,
                backgroundColor: Theme.of(context).highlightColor,
                progressColor: Theme.of(context).primaryColor,
                percent: meilenstein.getErledigteAufgaben().length /
                    (meilenstein.getAufgaben().length +
                        meilenstein.getErledigteAufgaben().length),
              ),*/
              FutureBuilder<List<Aufgaben>>(
                future: aufgabe.aufgabenMS(meilenstein.titel),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Error!"),);
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
                          onChanged:(bool value){ changeCheck(snapshot.data[index].titel, snapshot.data[index].meilenstein_id, snapshot.data[index].erledigt);},
                          title: Text(
                            snapshot.data[index].titel,
                            style: Theme.of(context).textTheme.body2,
                          ),
                          subtitle: Text(
                            "Erledigen bis: " + snapshot.data[index].datum,
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
  }

  bool isChecked(int i){
    if(i == 0){
      return false;
    }
    else {
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

  Future<void> _meilenSteinLoschenDialog() async {
    return showDialog<void> (
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: Theme.of(context).dialogTheme.shape,
          title: Text(meilenstein.titel + ' löschen?'),
          actions: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              color: Theme.of(context).buttonColor,
              child: Text(
                "Abbrechen",
                style: Theme.of(context).textTheme.body2,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Text(
                "Bestätigen",
                style: Theme.of(context).accentTextTheme.body2,
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () async {
                Meilenstein_db ms = new Meilenstein_db();
                await ms.deleteMS(meilenstein.titel);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
