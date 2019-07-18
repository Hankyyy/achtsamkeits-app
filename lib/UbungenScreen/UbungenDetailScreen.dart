import 'package:flutter/material.dart';


class UbungenDetailScreen extends StatefulWidget {
  @override
  _UbungenDetailScreenState createState() => _UbungenDetailScreenState();
}

class _UbungenDetailScreenState extends State<UbungenDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atem Anker', style: TextStyle(fontSize: 30.0),),
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