import 'package:flutter/material.dart';
import 'package:ape_of_mind/Model/aufgaben.dart';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:ape_of_mind/Model/aufgaben.dart';
import 'package:ape_of_mind/Model/meilenstein.dart';

class EditMeilensteinScreen extends StatefulWidget {
  Meilenstein_db meilenstein;

  EditMeilensteinScreen(this.meilenstein);

  @override
  _EditMeilensteinScreenState createState() =>
      _EditMeilensteinScreenState(meilenstein);
}

class _EditMeilensteinScreenState extends State<EditMeilensteinScreen> {
  Meilenstein_db meilenstein;

  Aufgaben aufgabe = new Aufgaben();

  double borderThickness = 1;

  DateTime datumsDaten;

  int i;
  int length;

  bool view;

  DateTime selectedDate = DateTime.now();
  DateTime deadlineDate = DateTime.now();

  TextEditingController msNotiz;

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

  _EditMeilensteinScreenState(this.meilenstein);

  @override
  void initState() {
    msNotiz = TextEditingController();
    msNotiz.text = meilenstein.notizen;
    var date;
    //DateTime(int.parse(date[0]), int.parse(date[1]), int.parse(date[2]))
    String datum = meilenstein.datum;
    String deadline = meilenstein.deadline;
    var datumG = datum.split(".");
    var deadlineG = deadline.split(".");
    selectedDate = DateTime(int.parse(datumG[0]), int.parse(datumG[1]), int.parse(datumG[2]));
    deadlineDate = DateTime(int.parse(deadlineG[0]), int.parse(deadlineG[1]), int.parse(deadlineG[2]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Meilenstein bearbeiten',
          style: TextStyle(
              fontSize: 30.0, color: Theme.of(context).textTheme.title.color),
        ),
        backgroundColor: Theme.of(context).appBarTheme.color,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            size: 30.0,
          ),
          color: Theme.of(context).textTheme.title.color,
          tooltip: "Abbrechen",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
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
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                padding: EdgeInsets.all(0),
                child: Form(
                  child: ListView(
                    shrinkWrap: true,
                    primary: false,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'Meilenstein:',
                                  style: Theme.of(context).textTheme.body2,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    meilenstein.titel,
                                    style: Theme.of(context).textTheme.title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Erledigen bis:',
                                  style: Theme.of(context).textTheme.body2,
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
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
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
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
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
                              decoration: InputDecoration(
                                labelText: "Notizen",
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(),
                                ), //fillColor: Colors.green
                              ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder<List<Aufgaben>>(
                        future: aufgabe.aufgabenMS(meilenstein.titel),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("Error!"),
                            );
                          }
                          List<Aufgaben> aufgaben = snapshot.data ?? [];
                          Aufgaben af = Aufgaben();
                          return getAufgaben(snapshot);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //minWidth: MediaQuery.of(context).size.width-40,
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Bestätigen",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).accentTextTheme.title,
                  )
                ],
              ),
              onPressed: () {
                Meilenstein_db ms = Meilenstein_db();
                ms.updateMS(
                    meilenstein.titel,
                    "${selectedDate.year.toString()}" +
                        "."
                            "${selectedDate.month.toString()}" +
                        "."
                            "${selectedDate.day.toString()}",
                    "${deadlineDate.year.toString()}" +
                        "."
                            "${deadlineDate.month.toString()}" +
                        "."
                            "${deadlineDate.day.toString()}",
                    msNotiz.text);
                setState(
                  () {
                    Navigator.pop(context);
                  },
                );
              },
              splashColor: Theme.of(context).highlightColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget getAufgaben(var snapshot) {
    if (snapshot.data.length != 0)
      return ExpansionTile(
        title: Text(
          "Aufgaben",
          style: Theme.of(context).textTheme.body1,
        ),
        children: <Widget>[
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Center(
                child: ListTile(
                  title: Text(
                    snapshot.data[index].titel,
                    style: Theme.of(context).textTheme.body2,
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      size: 22.5,
                      color: Theme.of(context).textTheme.title.color,
                    ),
                    tooltip: "Aufgabe löschen",
                    onPressed: () {
                      Aufgaben af = Aufgaben();
                      setState(
                        () {
                          af.deleteAFS(
                              snapshot.data[index].titel, meilenstein.titel);
                        },
                      );
                    },
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

  Future<void> _meilenSteinLoschenDialog() async {
    return showDialog<void>(
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
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}