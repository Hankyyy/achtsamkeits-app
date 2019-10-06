import 'package:flutter/material.dart';

import 'RatgeberUtils.dart';

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
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: ratgeberList().length,
        padding: EdgeInsets.only(left: 12.5, right: 12.5, bottom: 5),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: 10.0,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ExpansionTile(
                title: Padding(padding: EdgeInsets.symmetric(vertical: 12.5), child: getSub(ratgeberList()[index]),),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: Text(
                      ratgeberList()[index].inhalt,
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getSub(Ratgeber ratgeber) {
    if (ratgeber.unterTitel == "")
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            ratgeber.titel,
            style: Theme.of(context).textTheme.title,
          ),
        ],
      );
    else
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            ratgeber.titel,
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            ratgeber.unterTitel,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      );
  }
}
