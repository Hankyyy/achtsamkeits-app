import 'package:flutter/material.dart';
import 'package:achtsamkeit/database/dbHelper.dart';
import 'package:achtsamkeit/model/sleep.dart';
import 'dart:async';



//const myPrimColor = const Color(0xffE6E6FA);
/*
* main(){
*runApp(app);
* }
* */

/*
* A Stateful Widget can be loaded many times by calling setState().
* This will trigger the build(BuildContext ctxt) to be called again.
* */
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> { //buildmethode
  String trackName, trackBeschreibung;
  double trackAnzahl;
  final primcolor = const Color(0xffb2ebf2);

  createData(){
    //Status ändern
    setState(() {
      var dbHelper = DBHelper();
      var sleep = Sleep(trackName, trackBeschreibung, trackAnzahl);
      dbHelper.createSleep(sleep);
    });
    print("created");
  }

  updateData(){
    setState(() {
      var dbHelper = DBHelper();
      var sleep = Sleep(trackName, trackBeschreibung, trackAnzahl);
      dbHelper.updateSleep(sleep);
    });
    print("updated");
  }

  readData(){
    print("read");
  }

  deleteData(){
    print("deleted");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Achtsamkeitstracker")
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  hintText: "Name",
              ),
              onChanged: (String name){
                trackName = name;
              },
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Beschreibung"
              ),
              onChanged: (String beschreibung){
                trackBeschreibung = beschreibung;
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Anzahl"
              ),
              onChanged: (String anzahl){
                trackAnzahl = double.parse(anzahl);
              },
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: RaisedButton(
                      color: primcolor,
                      textColor: Colors.white,
                      child: Text("Create"),
                      onPressed: (){
                        createData();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: RaisedButton(
                      color: primcolor,
                      textColor: Colors.white,
                      child: Text("Update"),
                      onPressed: (){
                        updateData();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: RaisedButton(
                      color: primcolor,
                      textColor: Colors.white,
                      child: Text("Read"),
                      onPressed: (){
                        readData();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 0.0),
                    child: RaisedButton(
                      color: primcolor,
                      textColor: Colors.white,
                      child: Text("Delete"),
                      onPressed: (){
                        deleteData();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
