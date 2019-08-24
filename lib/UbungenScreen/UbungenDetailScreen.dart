import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';

import 'package:aaproto2/UbungenScreen/UbungenClass.dart';

class UbungenDetailScreen extends StatelessWidget {
  final Ubung ubung;

  UbungenDetailScreen({Key key, @required this.ubung}) : super(key: key);

  var textstyletop = TextStyle(fontSize: 16.0, color: Colors.white);
  var textstylebottom = TextStyle(fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ubung.title,
          style: TextStyle(fontSize: 30.0),
        ),
        actions: <Widget>[],
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Card(
                  color: AAThemeData.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 17.5, horizontal: 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Bereich: ",
                                textAlign: TextAlign.start,
                                style: aAWhiteBold,
                              ),
                              Text(
                                ubung.bereich + "\n",
                                textAlign: TextAlign.start,
                                style: aAWhiteReg,
                              ),
                              Text(
                                "Anwendungsgebiet: ",
                                textAlign: TextAlign.start,
                                style: aAWhiteBold,
                              ),
                              Text(
                                ubung.anwendungsgebiet,
                                textAlign: TextAlign.start,
                                style: aAWhiteReg,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Wiederholungen: ",
                                textAlign: TextAlign.end,
                                style: aAWhiteBold,
                              ),
                              Text(
                                " " + ubung.wiederholungen + "\n",
                                textAlign: TextAlign.end,
                                style: aAWhiteReg,
                              ),
                              Text(
                                "Dauer: ",
                                textAlign: TextAlign.end,
                                style: aAWhiteBold,
                              ),
                              Text(
                                " " + ubung.dauer.toString() + " Minuten",
                                textAlign: TextAlign.end,
                                style: aAWhiteReg,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 17.5, horizontal: 20.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          ubung.erklarung + "\n",
                          textAlign: TextAlign.start,
                          style: aABlackReg,
                        ),
                        Text(
                          ubung.einleitung,
                          textAlign: TextAlign.start,
                          style: aABlackReg,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Bereit?",
                    style: aABlackBold,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 7.5),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 40.0,
                    minWidth: 70.0,
                    color: AAThemeData.primaryColor,
                    textColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Los gehts!",
                          textAlign: TextAlign.center,
                          style: aAWhiteBold,
                        )
                      ],
                    ),
                    onPressed: () {},
                    splashColor: AAThemeData.highlightColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
