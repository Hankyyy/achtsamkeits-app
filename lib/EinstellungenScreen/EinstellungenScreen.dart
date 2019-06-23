import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';

class EinstellungenScreen extends StatefulWidget {
  @override
  _EinstellungenScreenState createState() => _EinstellungenScreenState();
}

class _EinstellungenScreenState extends State<EinstellungenScreen> {

  @override
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
                "Einstellungen",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.only(
                top: 30.0,
              ),
              child: ListTile(
                title: Text(
                  "Benachrichtigungen",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              )),
          ListTile(
            title: Text(
              "Tracker",
              style: TextStyle(fontSize: 17.5),
            ),
            leading: Icon(
              Icons.insert_emoticon,
              color: AAThemeData.primaryColor,
            ),
            trailing: Switch(value: true, onChanged: null),
          ),
          ListTile(
            title: Text(
              "Termine",
              style: TextStyle(fontSize: 17.5),
            ),
            leading: Icon(
              Icons.calendar_today,
              color: AAThemeData.primaryColor,
            ),
            trailing: Switch(value: true, onChanged: null),
          ),
          ListTile(
            title: Text(
              "Lernen",
              style: TextStyle(fontSize: 17.5),
            ),
            leading: Icon(
              Icons.book,
              color: AAThemeData.primaryColor,
            ),
            trailing: Switch(value: true, onChanged: null),
          ),
          Container(
              padding: EdgeInsets.only(
                top: 20.0,
              ),
              child: ListTile(
                title: Text(
                  "Design",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              )),
          ListTile(
            title: Text(
              "Darktheme",
              style: TextStyle(fontSize: 17.5),
            ),
            leading: Icon(
              Icons.brightness_3,
              color: AAThemeData.primaryColor,
            ),
            trailing: Switch(value: true, onChanged: null),
          ),
          ListTile(
            title: Text(
              "Akzentfarbe",
              style: TextStyle(fontSize: 17.5),
            ),
            leading: Icon(
              Icons.color_lens,
              color: AAThemeData.primaryColor,
            ),
            trailing: Container(
              height: 35.0,
              width: 60.0,
              decoration: BoxDecoration(
                  color: AAThemeData.accentColor,
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))),
            ),
          ),
          Container(
              padding: EdgeInsets.only(
                top: 20.0,
              ),
              child: ListTile(
                title: Text(
                  "Account",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              )),
          OutlineButton(
            child: Text("Anmelden"),
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            onPressed: () => {},
            color: AAThemeData.accentColor,
            disabledBorderColor: AAThemeData.accentColor,
            highlightedBorderColor: AAThemeData.primaryColor,
          ),
          OutlineButton(
            child: Text("Registrieren"),
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            onPressed: () => {},
            color: AAThemeData.accentColor,
            disabledBorderColor: AAThemeData.accentColor,
            highlightedBorderColor: AAThemeData.primaryColor,
          ),
        ],
      ),
    );
  }
}
