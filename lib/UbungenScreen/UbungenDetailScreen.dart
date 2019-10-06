import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import 'UbungenUtils.dart';
import 'UbungenPlayScreen.dart';

class UbungenDetailScreen extends StatelessWidget {
  final Ubung ubung;
  final int index;

  UbungenDetailScreen({Key key, @required this.ubung, this.index})
      : super(key: key);

  final TextStyle textstyletop = TextStyle(fontSize: 16.0, color: Colors.white);
  final TextStyle textstylebottom = TextStyle(fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          ubung.title,
          style: TextStyle(
              fontSize: 30.0, color: Theme.of(context).textTheme.title.color),
        ),
        backgroundColor: Theme.of(context).appBarTheme.color,
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
        elevation: 0.0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        children: <Widget>[
          Column(
            children: <Widget>[
              Card(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 17.5, horizontal: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Bereich: ",
                              textAlign: TextAlign.start,
                              style: Theme.of(context).accentTextTheme.title,
                            ),
                            Text(
                              ubung.bereich + "\n",
                              textAlign: TextAlign.start,
                              style: Theme.of(context).accentTextTheme.body2,
                            ),
                            Text(
                              "Anwendungsgebiet: ",
                              textAlign: TextAlign.start,
                              style: Theme.of(context).accentTextTheme.title,
                            ),
                            Text(
                              ubung.anwendungsgebiet,
                              textAlign: TextAlign.start,
                              style: Theme.of(context).accentTextTheme.body2,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Wiederholungen: ",
                              textAlign: TextAlign.end,
                              style: Theme.of(context).accentTextTheme.title,
                            ),
                            Text(
                              " " + ubung.wiederholungen + "\n",
                              textAlign: TextAlign.end,
                              style: Theme.of(context).accentTextTheme.body2,
                            ),
                            Text(
                              "Dauer: ",
                              textAlign: TextAlign.end,
                              style: Theme.of(context).accentTextTheme.title,
                            ),
                            Text(
                              " " +
                                  ubung.duration.inMinutes.toString() +
                                  getMinuten(ubung.duration.inMinutes),
                              textAlign: TextAlign.end,
                              style: Theme.of(context).accentTextTheme.body2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 17.5, horizontal: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        ubung.erklarung + "\n",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.body2,
                      ),
                      Text(
                        ubung.einleitung,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Bereit?",
                  style: Theme.of(context).textTheme.title,
                ),
                Container(
                  padding: EdgeInsets.only(left: 7.5),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  height: 40.0,
                  minWidth: 70.0,
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Los gehts!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).accentTextTheme.title,
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UbungenPlayScreen(
                              ubung: ubung,
                              index: index,
                            ),
                      ),
                    );
                  },
                  splashColor: Theme.of(context).highlightColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getMinuten(int i) {
    if (i != 1)
      return " Minuten";
    else
      return " Minute";
  }
}
