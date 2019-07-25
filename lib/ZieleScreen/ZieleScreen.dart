import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';
import 'package:aaproto2/ZieleScreen/ZielCardWidget.dart';
import 'package:aaproto2/ZieleScreen/MeilensteinList.dart';
import 'package:aaproto2/ZieleScreen/ZielClasses.dart';

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
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: getMeilensteine().length,
        itemBuilder: (context, index) {
          return ZielCard(getMeilensteine()[index],);
        },
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