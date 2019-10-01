import 'package:flutter/material.dart';

class RatgeberScreen extends StatefulWidget {
  @override
  _RatgeberScreenState createState() => _RatgeberScreenState();
}

class _RatgeberScreenState extends State<RatgeberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ratgeber',
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
        padding: EdgeInsets.symmetric(horizontal: 12.5),
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Prüfungsangst",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Ich habe Angst vor der anstehenden Prüfung, was soll ich tun?",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    ExpansionTile(
                      title: Text("coming soon"),
                      children: <Widget>[],
                    ),
                    ExpansionTile(
                      title: Text("coming soon"),
                      children: <Widget>[],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Zweifel am Studium",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Habe ich die richtige Wahl getroffen?",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    ExpansionTile(
                      title: Text("Fachstudienberatung"),
                      children: <Widget>[],
                    ),
                    ExpansionTile(
                      title: Text("Workshops"),
                      children: <Widget>[],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Anschluss",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Wie kann ich neue Freunde finden?",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    ExpansionTile(
                      title: Text("Ersti-Woche"),
                      children: <Widget>[],
                    ),
                    ExpansionTile(
                      title: Text("Vorkurse"),
                      children: <Widget>[],
                    ),
                    ExpansionTile(
                      title: Text("Hochschulsport"),
                      children: <Widget>[],
                    ),
                    ExpansionTile(
                      title: Text("Vorlesung/Übung/Praktika"),
                      children: <Widget>[],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
