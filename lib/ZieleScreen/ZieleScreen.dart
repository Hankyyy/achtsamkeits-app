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
      appBar: AppBar(
        title: Text('Ziele', style: TextStyle(fontSize: 30.0),),
        actions: <Widget>[

        ],
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
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
          Container(padding: EdgeInsets.only(bottom: 75.0),),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/NeuerMeilensteinScreen");
        },
        child: Icon(Icons.add, size: 35.0, color: Colors.grey[200],),
        backgroundColor: AAThemeData.accentColor,
      ),
    );
  }
}