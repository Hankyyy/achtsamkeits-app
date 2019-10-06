import 'package:flutter/material.dart';
import 'package:ape_of_mind/Model/meilenstein.dart';

import 'package:auto_size_text/auto_size_text.dart';

class AddMeilensteinScreen extends StatefulWidget {
  @override
  _AddMeilensteinScreenState createState() => _AddMeilensteinScreenState();
}

class _AddMeilensteinScreenState extends State<AddMeilensteinScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime deadlineDate = DateTime.now();
  final msTitel = TextEditingController();
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
      setState(
        () {
          deadlineDate = picked;
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Meilenstein hinzufügen',
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
                padding: EdgeInsets.all(20),
                child: Form(
                  child: ListView(
                    shrinkWrap: true,
                    primary: false,
                    children: <Widget>[
                      TextFormField(
                        controller: msTitel,
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
                        height: 25,
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
                    "Hinzufügen",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).accentTextTheme.title,
                  )
                ],
              ),
              onPressed: () async {
                var ms = new Meilenstein_db();
                ms.titel = msTitel.text;
                if (selectedDate.day < 10 && selectedDate.month < 10) {
                  ms.datum = ("${selectedDate.year.toString()}" +
                      ".0"
                          "${selectedDate.month.toString()}" +
                      ".0"
                          "${selectedDate.day.toString()}");
                } else if(selectedDate.day < 10) {
                  ms.datum = ("${selectedDate.year.toString()}" +
                      "."
                          "${selectedDate.month.toString()}" +
                      ".0"
                          "${selectedDate.day.toString()}");
                } else if(selectedDate.month < 10) {
                  ms.datum = ("${selectedDate.year.toString()}" +
                      ".0"
                          "${selectedDate.month.toString()}" +
                      "."
                          "${selectedDate.day.toString()}");
                } else {
                  ms.datum = ("${selectedDate.year.toString()}" +
                      "."
                          "${selectedDate.month.toString()}" +
                      "."
                          "${selectedDate.day.toString()}");
                }

                if (deadlineDate.day < 10 && deadlineDate.month < 10) {
                  ms.deadline = ("${deadlineDate.year.toString()}" +
                      ".0"
                          "${deadlineDate.month.toString()}" +
                      ".0"
                          "${deadlineDate.day.toString()}");
                } else if(deadlineDate.day < 10) {
                  ms.deadline = ("${deadlineDate.year.toString()}" +
                      "."
                          "${deadlineDate.month.toString()}" +
                      ".0"
                          "${deadlineDate.day.toString()}");
                } else if(deadlineDate.month < 10) {
                  ms.deadline = ("${deadlineDate.year.toString()}" +
                      ".0"
                          "${deadlineDate.month.toString()}" +
                      "."
                          "${deadlineDate.day.toString()}");
                } else {
                  ms.deadline = ("${deadlineDate.year.toString()}" +
                      "."
                          "${deadlineDate.month.toString()}" +
                      "."
                          "${deadlineDate.day.toString()}");
                }
                ms.notizen = msNotiz.text;
                await ms.insertMeilenstein(ms);
                Navigator.pop(context);
              },
              splashColor: Theme.of(context).highlightColor,
            ),
          ),
        ],
      ),
    );
  }
}
