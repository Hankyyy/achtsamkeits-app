import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';


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
                //padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: _qaButtonHeight,
                minWidth: _qaButtonWidth,
                color: AAThemeData.accentColor,
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
                onPressed: () => {},
                splashColor: AAThemeData.primaryColor,
              ),
              MaterialButton(
                //padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: _qaButtonHeight,
                minWidth: _qaButtonWidth,
                color: AAThemeData.accentColor,
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
                onPressed: () => {},
                splashColor: AAThemeData.primaryColor,
              ),
            ],
          ),
          Container(padding: EdgeInsets.only(top: 15.0),),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: _qaButtonHeight,
                minWidth: _qaButtonWidth,
                color: AAThemeData.accentColor,
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
                onPressed: () => {},
                splashColor: AAThemeData.primaryColor,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: _qaButtonHeight,
                minWidth: _qaButtonWidth,
                color: AAThemeData.accentColor,
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
                onPressed: () => {},
                splashColor: AAThemeData.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
