import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';

class ZitatWidget extends StatefulWidget {
  @override
  _ZitatWidgetState createState() => _ZitatWidgetState();
}

class _ZitatWidgetState extends State<ZitatWidget> {
  var _zitat = (getZitate()..shuffle()).first;
  var _newZitat = Zitat();
  int i;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: InkWell(
          onLongPress: () {
            i = 0;
            while (i == 0) {
              _newZitat = (getZitate()..shuffle()).first;
              if (_zitat.name != _newZitat.name)
                setState(() {
                  _zitat = _newZitat;
                  i = 1;
                });
            }
          },
          child: Card(
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 10),
              child: ListTile(
                //contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                title: Text(
                  "„" + _zitat.inhalt + "“",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  "- " + _zitat.name,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 14.0,
                    //fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class Zitat {
  String name;
  String inhalt;

  Zitat({this.name, this.inhalt});
}

List<Zitat> getZitate() {
  return [
    Zitat(
      inhalt:
          "Arbeite an deinem Innern. Da ist die Quelle des Guten, eine unversiegbare Quelle, wenn du nur immer nachgräbst.",
      name: "Marc Aurel",
    ),
    Zitat(
      inhalt:
          "Was hinter uns liegt und was vor uns liegt, sind Kleinigkeiten verglichen mit dem, was in uns liegt.",
      name: "?",
    ),
    Zitat(
      inhalt: "Durch Nicht-Tun wird alles Tun möglich.",
      name: "frei nach Laotse",
    ),
    Zitat(
      inhalt:
          "Die Achtsamkeit aber, ihr Mönche, ist zu allem nützlich, sage ich.",
      name: "Buddha",
    ),
    Zitat(
      inhalt:
          "Probleme lassen sich niemals auf der Ebene des Denkens lösen, auf der sie auch entstanden sind.",
      name: "Albert Einstein",
    ),
    Zitat(
      inhalt:
          "Es gibt keine geringere und keine größere Meisterschaft als die Meisterschaft über sich selbst.",
      name: "Leonardo da Vinci",
    ),
    Zitat(
      inhalt:
          "Die älteste, selbstverständlichste und zuverlässigste Konstante in dieser Welt ist nicht bloß, dass wir glücklich sein wollen, sondern dass wir nur glücklich sein wollen. Unsere Natur verlangt es von uns.",
      name: "Augustinus",
    ),
    Zitat(
      inhalt: "Erst verstehen, dann verstanden werden.",
      name: "Stephen R. Covey",
    ),
    Zitat(
      inhalt:
          "Wer sich für andere interessiert, gewinnt in zwei Monaten mehr Freunde als jemand, der immer nur versucht, die anderen für sich zu interessieren, in zwei Jahren.",
      name: "Dale Carnegie",
    ),
    Zitat(
      inhalt: "Zum Frieden erziehen, um zum Frieden zu gelangen.",
      name: "Papst Johannes Paul II",
    ),
  ];
}
