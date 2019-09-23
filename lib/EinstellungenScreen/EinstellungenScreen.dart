import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:ape_of_mind/Theme/Theme.dart';

class EinstellungenScreen extends StatefulWidget {
  @override
  _EinstellungenScreenState createState() => _EinstellungenScreenState();
}

class _EinstellungenScreenState extends State<EinstellungenScreen> {
  bool i = true;
  bool j = true;
  bool k = true;
  bool darkModeValue = false;

  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Einstellungen',
          style: TextStyle(
              fontSize: 30.0, color: Theme.of(context).textTheme.title.color),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30.0,
          ),
          color: Theme.of(context).textTheme.title.color,
          tooltip: "Zurück",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Theme.of(context).appBarTheme.color,
        elevation: 0.0,
      ),
      body: ListView(
        padding: EdgeInsets.only(right: 12.5, left: 12.5, bottom: 12.5),
        children: <Widget>[
          BenachrichtigungenCard(),
          SizedBox(
            height: 10,
          ),
          designCard(context),
        ],
      ),
    );
  }

  int themeValue = 0;

  Widget designCard(context) {
    void handleChange(int i) {
      setState(
        () {
          selectedColor = i;
          themeValue = i;
          darkModeValue = false;
          switch (i) {
            case 0:
              DynamicTheme.of(context).setThemeData(grun);
              break;
            case 1:
              DynamicTheme.of(context).setThemeData(aquamarin);
              break;
            case 2:
              DynamicTheme.of(context).setThemeData(limette);
              break;
            case 3:
              DynamicTheme.of(context).setThemeData(bernstein);
              break;
            case 4:
              DynamicTheme.of(context).setThemeData(lila);
              break;
            case 5:
              DynamicTheme.of(context).setThemeData(indigo);
              break;
            case 6:
              DynamicTheme.of(context).setThemeData(cyan);
              break;
            case 7:
              DynamicTheme.of(context).setThemeData(blaugrau);
              break;
          }
        },
      );
    }

    String getTitle(int i) {
      switch (i) {
        case 0:
          return "Grün";
          break;
        case 1:
          return "Aquamarin";
          break;
        case 2:
          return "Limette";
          break;
        case 3:
          return "Bernstein";
          break;
        case 4:
          return "Lila";
          break;
        case 5:
          return "Indigo";
          break;
        case 6:
          return "Cyan";
          break;
        case 7:
          return "Blaugrau";
          break;
      }
    }

    void changeDarkTheme(bool state, context) {
      setState(
        () {
          if (state == true) {
            selectedColor = null;
            DynamicTheme.of(context).setThemeData(darkTheme);
          } else
            handleChange(themeValue);
        },
      );
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "Design",
              //style: aABlackBold,
            ),
          ),
          SwitchListTile(
            value: darkModeValue,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (bool newValue) {
              changeDarkTheme(newValue, context);
              setState(() {
                darkModeValue = newValue;
              });
            },
            secondary: Icon(
              Icons.insert_emoticon,
              color: Theme.of(context).primaryColor,
            ),
            //activeColor: AAThemeData.primaryColor,
            title: Text(
              "Darktheme",
              //style: aABlackReg,
            ),
          ),
          ExpansionTile(
            title: Text(
              "Farbe",
              //style: aABlackReg,
            ),
            leading: Icon(
              Icons.color_lens,
              color: Theme.of(context).primaryColor,
            ),
            children: <Widget>[
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: themes.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: RadioListTile(
                      title: Text(
                        getTitle(index),
                        style: Theme.of(context).textTheme.body2,
                      ),
                      value: index,
                      groupValue: selectedColor,
                      activeColor: Theme.of(context).primaryColor,
                      secondary: Container(
                        height: 30.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                            color: themes[index].primaryColor,
                            borderRadius:
                                BorderRadius.all(const Radius.circular(10.0))),
                      ),
                      onChanged: (value) {
                        handleChange(value);
                      },
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget BenachrichtigungenCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: ListTile(
              title: Text(
                "Benachrichtigungen",
                //style: aABlackBold,
              ),
            ),
          ),
          SwitchListTile(
            value: i,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (bool newValue) {
              setState(
                () {
                  i = newValue;
                },
              );
            },
            secondary: Icon(
              Icons.insert_emoticon,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "Tracker",
              //style: aABlackReg,
            ),
          ),
          SwitchListTile(
            value: j,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (bool newValue) {
              setState(
                () {
                  j = newValue;
                },
              );
            },
            secondary: Icon(
              Icons.calendar_today,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "Termine",
              //style: aABlackReg,
            ),
          ),
          SwitchListTile(
            value: k,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (bool newValue) {
              setState(
                () {
                  k = newValue;
                },
              );
            },
            secondary: Icon(
              Icons.bookmark,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "Lernen",
              //style: aABlackReg,
            ),
          ),
        ],
      ),
    );
  }
}
