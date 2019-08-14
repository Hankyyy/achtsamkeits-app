import 'package:flutter/material.dart';
import 'dart:async';

import 'package:aaproto2/ThemeData.dart';
import 'package:aaproto2/ZieleScreen/ZielCardWidget.dart';

class NeuerMeilensteinScreen extends StatefulWidget {
  @override
  _NeuerMeilensteinScreenState createState() => _NeuerMeilensteinScreenState();
}

class _NeuerMeilensteinScreenState extends State<NeuerMeilensteinScreen> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Text("test"),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      actions: <Widget>[
        RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          color: Colors.white,
          child: Text(
            "Abbrechen",
            style: TextStyle(fontSize: 16.0, color: AAThemeData.primaryColor),
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
  }
}

