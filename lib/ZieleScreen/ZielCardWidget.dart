import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';

class ZielCard extends StatefulWidget {

  ZielCard (this.first, this.second, this.third, this.fourth);

  int first;
  int second;
  int third;
  int fourth;

  @override
  _ZielCardState createState() => _ZielCardState(first, second, third, fourth);
}

class _ZielCardState extends State<ZielCard> {

  _ZielCardState (this.first, this.second, this.third, this.fourth);

  int first;
  int second;
  int third;
  int fourth;


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("Klausur " + first.toString(), style: TextStyle(fontSize: 20.0),),
            trailing: IconButton(icon: Icon(Icons.add), onPressed: () {
              Navigator.of(context).pushNamed('/neuesZiel');
            },),
          ),
          Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Container(
                height: 15.0,
                width: 350.0,
                decoration: BoxDecoration(
                    color: AAThemeData.primaryColor,
                    borderRadius: BorderRadius.all(const Radius.circular(10.0))),
              ),
              Container(
                height: 17.0,
                width: 150.0,
                decoration: BoxDecoration(
                    color: AAThemeData.accentColor,
                    borderRadius: BorderRadius.all(const Radius.circular(10.0))),
              ),
            ],
          ),
          ListTile(
            title: Text("Übung " + second.toString(), style: TextStyle(fontSize: 15.0)),
            trailing: Checkbox(value: false, onChanged: null),
          ),

          ListTile(
            title: Text("Übung " + third.toString(), style: TextStyle(fontSize: 15.0)),
            trailing: Checkbox(value: false, onChanged: null),
          ),
          ListTile(
            title: Text("Vorlesung " + fourth.toString(), style: TextStyle(fontSize: 15.0)),
            trailing: Checkbox(value: false, onChanged: null),
          ),
        ],
      ),
    );
  }
}
