import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';
import 'package:aaproto2/ZieleScreen/ZielCardWidget.dart';

class ZieleScreen extends StatefulWidget {
  @override
  _ZieleScreenState createState() => _ZieleScreenState();
}

class _ZieleScreenState extends State<ZieleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 40.0, left: 15.0, bottom: 10.0),
            child: Text(
              "Ziele",
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
          ),
          ZielCard(
            1,
            1,
            2,
            5,
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
          ),
          ZielCard(
            2,
            1,
            2,
            1,
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
          ),
          ZielCard(
            3,
            4,
            6,
            8,
          ),
        ],
      ),
    );
  }
}
