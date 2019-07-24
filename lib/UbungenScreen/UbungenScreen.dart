import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';

import 'package:aaproto2/UbungenScreen/UbungenClass.dart';
import 'package:aaproto2/UbungenScreen/UbungenList.dart';
import 'package:aaproto2/UbungenScreen/UbungenDetailScreen.dart';
import 'UbungenButtonWidget.dart';

class UbungenScreen extends StatefulWidget {
  @override
  _UbungenScreenState createState() => _UbungenScreenState();
}

class _UbungenScreenState extends State<UbungenScreen> {
  List<Ubung> ubungen;

  @override
  void initState() {
    ubungen = getUbungen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Übungen',
          style: TextStyle(fontSize: 30.0),
        ),
        actions: <Widget>[],
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
      ),
      body: Container(
          child: GridView.count(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              crossAxisCount: 2,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 20.0,
              children: List.generate(ubungen.length, (index) {
                return Center(
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 140.0,
                    minWidth: 170.0,
                    color: AAThemeData.buttonColor,
                    textColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          ubungen[index].icon,
                          size: 75.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0),
                        ),
                        Text(ubungen[index].title, textAlign: TextAlign.center,)
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              UbungenDetailScreen(ubung: ubungen[index])));
                    },
                    splashColor: AAThemeData.highlightColor,
                  ),
                );
              }))),
    );
  }
}
