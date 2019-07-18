import 'package:flutter/material.dart';
import 'dart:async';

import 'package:aaproto2/ThemeData.dart';
import 'package:aaproto2/ZieleScreen/ZielCardWidget.dart';

class NeuerMeilensteinScreen extends StatefulWidget {
  @override
  _NeuerMeilensteinScreenState createState() => _NeuerMeilensteinScreenState();
}

class _NeuerMeilensteinScreenState extends State<NeuerMeilensteinScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Neuer Meilenstein',
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
            padding: EdgeInsets.only(top: 25.0),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Geplant:'),
              SizedBox(
                height: 20.0,
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
              Text('Deadline:'),
              SizedBox(
                height: 20.0,
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
            highlightedBorderColor: AAThemeData.primaryColor,
            onPressed: null,
            child: Text("Hinzufügen"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
        ],
      ),
    );
  }
}
