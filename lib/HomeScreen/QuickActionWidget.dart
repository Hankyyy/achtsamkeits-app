import 'package:flutter/material.dart';

import 'package:aaproto2/EinstellungenScreen/EinstellungenScreen.dart';
import 'package:aaproto2/ThemeData.dart';
import 'package:aaproto2/UbungenScreen/UbungenList.dart';
import 'package:aaproto2/UbungenScreen/UbungenDetailScreen.dart';

class QAWidget extends StatefulWidget {
  @override
  _QAWidgetState createState() => _QAWidgetState();
}

class _QAWidgetState extends State<QAWidget> {
  double _qaButtonHeight = 140.0;
  double _qaButtonWidth = 170.0;
  double _quButtonIconSize = 75.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40.0),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: _qaButtonHeight,
                minWidth: _qaButtonWidth,
                color: AAThemeData.buttonColor,
                textColor: Colors.white,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.watch_later,
                      size: _quButtonIconSize,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text(
                      "Lern Timer",
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/LernTimerScreen");
                },
                splashColor: AAThemeData.highlightColor,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: _qaButtonHeight,
                minWidth: _qaButtonWidth,
                color: AAThemeData.buttonColor,
                textColor: Colors.white,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.accessibility_new,
                      size: _quButtonIconSize,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text("Atem Übung")
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          UbungenDetailScreen(ubung: getUbungen()[0])));
                },
                splashColor: AAThemeData.highlightColor,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 15.0),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: _qaButtonHeight,
                minWidth: _qaButtonWidth,
                color: AAThemeData.buttonColor,
                textColor: Colors.white,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.book,
                      size: _quButtonIconSize,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text("Ratgeber")
                  ],
                ),
                onPressed: () {},
                splashColor: AAThemeData.highlightColor,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: _qaButtonHeight,
                minWidth: _qaButtonWidth,
                color: AAThemeData.buttonColor,
                textColor: Colors.white,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      size: _quButtonIconSize,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text("Einstellungen")
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/EinstellungenScreen");
                },
                splashColor: AAThemeData.highlightColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
