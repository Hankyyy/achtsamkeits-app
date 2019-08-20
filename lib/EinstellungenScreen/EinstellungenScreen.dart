import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';

enum ThemeOptionen {
  green,
  blue,
  orange,
}

class EinstellungenScreen extends StatefulWidget {
  @override
  _EinstellungenScreenState createState() => _EinstellungenScreenState();
}

class _EinstellungenScreenState extends State<EinstellungenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Einstellungen',
          style: TextStyle(fontSize: 30.0),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[],
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
      ),
      body: ListView(
        padding: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
        children: <Widget>[
          Container(
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
              "Farbe",
              style: TextStyle(fontSize: 17.5),
            ),
            leading: Icon(
              Icons.color_lens,
              color: AAThemeData.primaryColor,
            ),
            trailing: InkWell(
              child: Container(
                height: 35.0,
                width: 60.0,
                decoration: BoxDecoration(
                    color: AAThemeData.primaryColor,
                    borderRadius:
                        BorderRadius.all(const Radius.circular(10.0))),
              ),
              onTap: () => changeTheme(context),
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
          OutlineButton(
            child: Text("Registrieren"),
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            onPressed: () => {},
            color: AAThemeData.accentColor,
            disabledBorderColor: AAThemeData.accentColor,
            highlightedBorderColor: AAThemeData.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
        ],
      ),
    );
  }

  Future<void> changeTheme(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            child: ThemeChanger(),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          actions: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              color: Colors.white,
              child: Text(
                "Abbrechen",
                style:
                    TextStyle(fontSize: 16.0, color: getTheme().primaryColor),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              color: getTheme().primaryColor,
              child: Text(
                "Bestätigen",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              onPressed: () {
                setState(() {ThemeOption;});
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

class ThemeChanger extends StatefulWidget {
  @override
  _ThemeChangerState createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  ThemeOptionen _themes;
  int selectedColor = 0;

  void handleChange(
    int i,
  ) {
    setState(() {
      selectedColor = i;
      ThemeOption = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 800,
          child: RadioListTile(
            title: const Text(
              'Grün',
              style: TextStyle(fontSize: 16.0),
            ),
            value: 0,
            groupValue: selectedColor,
            secondary: Container(
              height: 30.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))),
            ),
            onChanged: (value) {
              setState(() {
                handleChange(value);
              });
            },
          ),
        ),
        RadioListTile(
          title: const Text(
            'Blau',
            style: TextStyle(fontSize: 16.0),
          ),
          value: 1,
          groupValue: selectedColor,
          secondary: Container(
            height: 30.0,
            width: 100.0,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(const Radius.circular(10.0))),
          ),
          onChanged: (value) {
            setState(() {
              handleChange(value);
            });
          },
        ),
        RadioListTile(
          title: const Text(
            'Orange',
            style: TextStyle(fontSize: 16.0),
          ),
          value: 2,
          groupValue: selectedColor,
          secondary: Container(
            height: 30.0,
            width: 100.0,
            decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.all(const Radius.circular(10.0))),
          ),
          onChanged: (value) {
            setState(() {
              handleChange(value);
            });
          },
        ),
      ],
    );
  }
}
