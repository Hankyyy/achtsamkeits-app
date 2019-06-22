import 'package:flutter/material.dart';


class UbungenScreen extends StatefulWidget {
  @override
  _UbungenScreenState createState() => _UbungenScreenState();
}

class _UbungenScreenState extends State<UbungenScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Übungen', style: TextStyle(fontSize: 30.0),),
        actions: <Widget>[

        ],
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0, bottom: 10.0, left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[


          ],
        ),
      ),
    );
  }
}