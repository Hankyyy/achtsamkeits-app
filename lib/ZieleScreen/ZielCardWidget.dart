import 'package:flutter/material.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:aaproto2/ThemeData.dart';
import 'package:aaproto2/ZieleScreen/ZieleUtils.dart';

class ZielCard extends StatefulWidget {
  ZielCard(this.meilenstein, this.i, this.length);

  Meilenstein meilenstein;
  int i;
  int length;

  @override
  _ZielCardState createState() => _ZielCardState(meilenstein, i, length);
}

class _ZielCardState extends State<ZielCard> {
  _ZielCardState(this.meilenstein, this.i, this.length);

  double borderThickness = 1;

  Meilenstein meilenstein;
  int i;
  int length;

  bool view = true;

  DateTime selectedDate = DateTime.now();
  DateTime deadlineDate = DateTime.now();

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
    if (!view)
      return Container(
          padding: EdgeInsets.only(bottom: _getPadding(i, length).toDouble()),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: AAThemeData.primaryColor,
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
                    title: TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Titel",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialValue: meilenstein.title,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            size: 27,
                            color: Colors.black,
                          ),
                          tooltip: "Meilenstein löschen",
                          onPressed: () {
                            null;
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
                              style: aABlackReg,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            OutlineButton(
                              onPressed: () => _selectDate(context),
                              highlightedBorderColor: AAThemeData.primaryColor,
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
                              style: aABlackReg,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            OutlineButton(
                              onPressed: () => _deadlineDate(context),
                              highlightedBorderColor: AAThemeData.primaryColor,
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
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          initialValue: meilenstein.notizen,
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
                      style: TextStyle(color: Colors.black),
                    ),
                    children: <Widget>[
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: meilenstein.getAlleAufgaben().length,
                        itemBuilder: (context, index) {
                          return Center(
                              child: ListTile(
                            title: Text(
                              meilenstein.getAlleAufgaben()[index].title,
                              style: aABlackReg,
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                size: 20,
                                color: Colors.black,
                              ),
                              tooltip: "Aufgabe löschen",
                              onPressed: () {
                                null;
                              },
                            ),
                          ));
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
                        color: Colors.white,
                        child: Text(
                          "Abbrechen",
                          style: aABlackReg,
                        ),
                        onPressed: () {
                          setState(() {
                            view = true;
                          });
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
                          style: aAWhiteReg,
                        ),
                        color: AAThemeData.primaryColor,
                        onPressed: () {
                          setState(() {
                            view = true;
                          });
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
              )),
            ),
          ));
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
                  meilenstein.title,
                  style: aABlackBold,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Erledigen bis: " +
                          meilenstein.geplant.day.toString() +
                          "." +
                          meilenstein.geplant.month.toString() +
                          "." +
                          meilenstein.geplant.year.toString(),
                      style: aAGreySmall,
                    ),
                    Text(
                      "Deadline: " +
                          meilenstein.deadline.day.toString() +
                          "." +
                          meilenstein.deadline.month.toString() +
                          "." +
                          meilenstein.deadline.year.toString(),
                      style: aAGreySmall,
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 23,
                        color: Colors.black,
                      ),
                      tooltip: "Meilenstein bearbeiten",
                      onPressed: () {
                        setState(() {
                          view = false;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 30.5,
                        color: Colors.black,
                      ),
                      tooltip: "Neue Aufgabe hinzufügen",
                      onPressed: () {
                        _addAufgabe(context);
                      },
                    ),
                  ],
                ),
              ),
              _getNotizen(),
              LinearPercentIndicator(
                padding: EdgeInsets.symmetric(horizontal: 25),
                lineHeight: 15,
                backgroundColor: AAThemeData.highlightColor,
                progressColor: AAThemeData.primaryColor,
                percent: meilenstein.getErledigteAufgaben().length /
                    (meilenstein.getAufgaben().length +
                        meilenstein.getErledigteAufgaben().length),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: meilenstein.getAufgaben().length,
                itemBuilder: (context, index) {
                  return Center(
                      child: CheckboxListTile(
                    value: false,
                    onChanged: null,
                    title: Text(
                      meilenstein.getAufgaben()[index].title,
                      style: aABlackReg,
                    ),
                    subtitle: Text(
                      "Erledigen bis: " +
                          meilenstein.getAufgaben()[index].geplant.day.toString() +
                          "." +
                          meilenstein.getAufgaben()[index].geplant.month.toString() +
                          "." +
                          meilenstein.getAufgaben()[index].geplant.year.toString(),
                      style: aAGreySmall,
                    ),
                  ));
                },
              ),
              SizedBox(
                height: 10,
              ),
              ExpansionTile(
                title: Text(
                  "Erledigte Aufgaben",
                  style: TextStyle(color: Colors.black),
                ),
                children: <Widget>[
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: meilenstein.getErledigteAufgaben().length,
                    itemBuilder: (context, index) {
                      return Center(
                          child: CheckboxListTile(
                        value: true,
                        onChanged: null,
                        activeColor: Colors.grey,
                        title: Text(
                          meilenstein.getErledigteAufgaben()[index].title,
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                      ));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      );
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
          style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
        ),
      );
  }

  Future<void> _addAufgabe(BuildContext context) {
    DateTime selectedDate = DateTime.now();

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

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Neue Aufgabe",
            style: aABlackBold,
          ),
          content: Container(
              width: 800,
              child: Form(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Titel",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 25.0),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Erledigen bis:',
                          style: aABlackReg,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        OutlineButton(
                          onPressed: () => _selectDate(context),
                          highlightedBorderColor: AAThemeData.primaryColor,
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
                  ],
                ),
              )),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          actions: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              color: Colors.white,
              child: Text(
                "Abbrechen",
                style: aABlackReg,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              color: AAThemeData.primaryColor,
              child: Text(
                "Bestätigen",
                style: aAWhiteReg,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}
