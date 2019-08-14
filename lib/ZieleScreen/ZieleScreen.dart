import 'package:flutter/material.dart';
import 'dart:async';

import 'package:aaproto2/ThemeData.dart';
import 'package:aaproto2/ZieleScreen/ZielCardWidget.dart';

import 'package:aaproto2/ZieleScreen/ZieleUtils.dart';

class ZieleScreen extends StatefulWidget {
  @override
  _ZieleScreenState createState() => _ZieleScreenState();
}

class _ZieleScreenState extends State<ZieleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ziele',
          style: TextStyle(fontSize: 30.0),
        ),
        actions: <Widget>[],
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: getMeilensteine().length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
            child: ZielCard(
              getMeilensteine()[index], index, getMeilensteine().length,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addMeilenstein(context);
        },
        child: Icon(
          Icons.add,
          size: 35.0,
          color: Colors.grey[200],
        ),
        backgroundColor: AAThemeData.accentColor,
      ),
    );
  }

  Future<void> _addMeilenstein(BuildContext context) {
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

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Neuer Meilenstein",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                        Text('Erledigen bis:'),
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
                        Text('Deadline:'),
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
                    Container(
                      padding: EdgeInsets.only(top: 25.0),
                    ),
                    TextFormField(
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
                style:
                    TextStyle(fontSize: 16.0, color: AAThemeData.primaryColor),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Text(
                "Bestätigen",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}
