import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';
import 'package:aaproto2/ZieleScreen/ZielClasses.dart';

class ZielCard extends StatefulWidget {
  ZielCard(this.meilenstein);

  Meilenstein meilenstein;

  @override
  _ZielCardState createState() => _ZielCardState(meilenstein);
}

class _ZielCardState extends State<ZielCard> {
  _ZielCardState(this.meilenstein);

  Meilenstein meilenstein;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(
              meilenstein.title,
              style: TextStyle(fontSize: 20.0),
            ),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, "/NeueAufgabeScreen");
              },
            ),
          ),
          Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                height: 15.0,
                width: 350.0,
                decoration: BoxDecoration(
                    color: AAThemeData.primaryColor,
                    borderRadius:
                        BorderRadius.all(const Radius.circular(10.0))),
              ),
              Container(
                height: 17.0,
                width: 150.0,
                decoration: BoxDecoration(
                    color: AAThemeData.accentColor,
                    borderRadius:
                        BorderRadius.all(const Radius.circular(10.0))),
              ),
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: meilenstein.aufgaben.length,
            itemBuilder: (context, index) {
              return Center(
                  child: CheckboxListTile(value: false, onChanged: null, title: Text(meilenstein.aufgaben[index].title, style: TextStyle(color: Colors.black),),)
              );
            },
          ),
        ],
      ),
    );
  }
}
