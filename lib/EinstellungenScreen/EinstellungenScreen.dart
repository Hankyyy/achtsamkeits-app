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
  bool i = true;
  bool j = true;
  bool k = true;
  bool l = false;

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
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                Container(
                    child: ListTile(
                  title: Text(
                    "Benachrichtigungen",
                    style: aABlackBold,
                  ),
                )),
                SwitchListTile(
                  value: i,
                  onChanged: (bool newValue) {
                    setState(() {
                      i = newValue;
                    });
                  },
                  secondary: Icon(
                    Icons.insert_emoticon,
                    color: AAThemeData.primaryColor,
                  ),
                  activeColor: AAThemeData.primaryColor,
                  title: Text(
                    "Tracker",
                    style: aABlackReg,
                  ),
                ),
                SwitchListTile(
                  value: j,
                  onChanged: (bool newValue) {
                    setState(() {
                      j = newValue;
                    });
                  },
                  secondary: Icon(
                    Icons.calendar_today,
                    color: AAThemeData.primaryColor,
                  ),
                  title: Text(
                    "Termine",
                    style: aABlackReg,
                  ),
                ),
                SwitchListTile(
                  value: k,
                  onChanged: (bool newValue) {
                    setState(() {
                      k = newValue;
                    });
                  },
                  secondary: Icon(
                    Icons.bookmark,
                    color: AAThemeData.primaryColor,
                  ),
                  title: Text(
                    "Lernen",
                    style: aABlackReg,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Design",
                    style: aABlackBold,
                  ),
                ),
                SwitchListTile(
                  value: false,
                  onChanged: null,
                  secondary: Icon(
                    Icons.insert_emoticon,
                    color: AAThemeData.primaryColor,
                  ),
                  title: Text(
                    "Darktheme",
                    style: aABlackReg,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Farbe",
                    style: aABlackReg,
                  ),
                  leading: Icon(
                    Icons.color_lens,
                    color: AAThemeData.primaryColor,
                  ),
                  trailing: InkWell(
                    borderRadius: BorderRadius.circular(10),
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
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //minWidth: MediaQuery.of(context).size.width-40,
              color: AAThemeData.primaryColor,
              textColor: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Anmelden",
                    textAlign: TextAlign.center,
                    style: aAWhiteBold,
                  )
                ],
              ),
              onPressed: () {},
              splashColor: AAThemeData.highlightColor,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //minWidth: MediaQuery.of(context).size.width-20,
              color: AAThemeData.buttonColor,
              //textColor: AAThemeData.primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Registrieren",
                    textAlign: TextAlign.center,
                    style: aABlackBold,
                  )
                ],
              ),
              onPressed: () {},
              splashColor: AAThemeData.highlightColor,
            ),
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
                setState(() {
                  ThemeOption;
                });
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
