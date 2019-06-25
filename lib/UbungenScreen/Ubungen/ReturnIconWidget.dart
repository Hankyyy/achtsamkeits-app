import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';

class RIWidget extends StatefulWidget {
  @override
  _RIWidgetState createState() => _RIWidgetState();
}

class _RIWidgetState extends State<RIWidget> {

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 40.0),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 50.0,
                  ),
                  padding: EdgeInsets.only(right: 35.0),
                  onPressed: () =>
                  {
                  Navigator.of(context).pop(true)
                  }),
              Text(
                "Der Atem-Anker", textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 30.0),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 40.0),
              ),
              Text(
                "Ziele: Entspannung Stressreduktion, Steigerung \n\n"
                    "der Achtsamkeit \n\n"
                    "Empfohlene Wiederholungen: 3x täglich \n\n"
                    "Vorraussetzungen: Sitz oder Liegemöglichkeit \n\n"
              ),
            ],
          )
        ],
      ),
    );
  }

}

