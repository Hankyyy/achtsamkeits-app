import 'package:flutter/material.dart';

import 'package:aaproto2/EinstellungenScreen/EinstellungenScreen.dart';
import 'package:aaproto2/ThemeData.dart';
import 'package:aaproto2/UbungenScreen/UbungenList.dart';
import 'package:aaproto2/UbungenScreen/UbungenDetailScreen.dart';
import 'package:aaproto2/test.dart';


import 'package:aaproto2/UbungenScreen/UbungenClass.dart';
import 'package:aaproto2/UbungenScreen/UbungenList.dart';

class QAWidget extends StatefulWidget {
  @override
  _QAWidgetState createState() => _QAWidgetState();
}

class _QAWidgetState extends State<QAWidget> {
  double _qaButtonHeight = 115.0;
  double _qaButtonWidth = 120.0;
  double _quButtonIconSize = 55.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25.0),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: _qaButtonHeight,
                minWidth: _qaButtonWidth,
                color: Colors.white,
                textColor: AAThemeData.buttonColor,
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
                splashColor: AAThemeData.buttonColor,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: _qaButtonHeight,
                minWidth: _qaButtonWidth,
                color: Colors.white,
                textColor: AAThemeData.buttonColor,
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
                onPressed: () {
                  Navigator.pushNamed(context, "/RatgeberScreen");
                },
                splashColor: AAThemeData.buttonColor,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: _qaButtonHeight,
                minWidth: _qaButtonWidth,
                color: Colors.white,
                textColor: AAThemeData.buttonColor,
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
                splashColor: AAThemeData.buttonColor
                ,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: _qaButtonHeight,
                minWidth: _qaButtonWidth,
                color: AAThemeData.buttonColor,
                textColor: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      getUbungen()[2].icon,
                      size: _quButtonIconSize,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text(getUbungen()[2].quickTitle, textAlign: TextAlign.center,)
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          UbungenDetailScreen(ubung: getUbungen()[2])));
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      getUbungen()[1].icon,
                      size: _quButtonIconSize,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text(getUbungen()[1].quickTitle, textAlign: TextAlign.center,)
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          UbungenDetailScreen(ubung: getUbungen()[1])));
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      getUbungen()[0].icon,
                      size: _quButtonIconSize,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text(getUbungen()[0].quickTitle, textAlign: TextAlign.center,)
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
        ],
      ),
    );
  }
}
