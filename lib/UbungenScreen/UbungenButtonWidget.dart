import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';
import 'package:aaproto2/UbungenScreen/UbungenDetailScreen.dart';

class UBWidget extends StatefulWidget {
  @override
  _UBWidgetState createState() => _UBWidgetState();
}

class _UBWidgetState extends State<UBWidget> {
  double _ubButtonHeight = 140.0;
  double _ubButtonWidth = 170.0;
  double _ubButtonIconSize = 75.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
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
                height: _ubButtonHeight,
                minWidth: _ubButtonWidth,
                color: AAThemeData.buttonColor,
                textColor: Colors.white,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.accessibility,
                      size: _ubButtonIconSize,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text(
                      "Atem Anker",
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/AtemAnkerScreen");
                },
                splashColor: AAThemeData.highlightColor,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: _ubButtonHeight,
                minWidth: _ubButtonWidth,
                color: AAThemeData.buttonColor,
                textColor: Colors.white,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.thumbs_up_down,
                      size: _ubButtonIconSize,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text("Meditation")
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/UbungenDetailScreen");
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
                height: _ubButtonHeight,
                minWidth: _ubButtonWidth,
                color: AAThemeData.buttonColor,
                textColor: Colors.white,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.airline_seat_recline_extra,
                      size: _ubButtonIconSize,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text("Chillaxxen")
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/UbungenDetailScreen");
                },
                splashColor: AAThemeData.highlightColor,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: _ubButtonHeight,
                minWidth: _ubButtonWidth,
                color: AAThemeData.buttonColor,
                textColor: Colors.white,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.format_underlined,
                      size: _ubButtonIconSize,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text("Ubung 4")
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/UbungenDetailScreen");
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
