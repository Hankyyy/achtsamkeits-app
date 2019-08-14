import 'package:flutter/material.dart';
import 'dart:async';

import 'package:aaproto2/ThemeData.dart';

class NeueAufgabeScreen extends StatefulWidget {
  @override
  _NeueAufgabeScreenState createState() => _NeueAufgabeScreenState();
}

class _NeueAufgabeScreenState extends State<NeueAufgabeScreen> {
  DateTime geplantDate = DateTime.now();
  DateTime deadlineDate = DateTime.now();
  String dropdownValue = 'Klausur 1';

  Future<Null> _geplantDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: geplantDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != geplantDate)
      setState(() {
        geplantDate = picked;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Neue Aufgabe',
          style: TextStyle(fontSize: 30.0),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[],
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0),
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
            padding: EdgeInsets.only(top: 15.0),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[],
          ),
          Container(
            padding: EdgeInsets.only(top: 15.0),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Erledigen bis:'),
              OutlineButton(
                onPressed: () => _geplantDate(context),
                highlightedBorderColor: AAThemeData.primaryColor,
                child: Text("${geplantDate.day.toString()}" +
                    "."
                        "${geplantDate.month.toString()}" +
                    "."
                        "${geplantDate.year.toString()}"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.grey[100],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Meilenstein:'),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[350]),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  underline: Container(),
                  elevation: 1,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>[
                    'Klausur 1',
                    'Klausur 2',
                    'Klausur 3',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 25.0),
          ),
          TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              decoration: InputDecoration(
                labelText: "Notizen",
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(),
                ), //fillColor: Colors.green
              )),
          Container(
            padding: EdgeInsets.only(top: 50.0),
          ),
          OutlineButton(
            onPressed: null,
            highlightedBorderColor: AAThemeData.primaryColor,
            child: Text("Hinzufügen"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
        ],
      ),
    );
  }
}
