import 'package:flutter/material.dart';


import 'package:aaproto2/ThemeData.dart';
import 'package:aaproto2/HomeScreen/TrackerUtils.dart';

class TrackerKalenderScreen extends StatefulWidget {
  @override
  _TrackerKalenderScreenState createState() => _TrackerKalenderScreenState();
}

class _TrackerKalenderScreenState extends State<TrackerKalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.insert_emoticon)),
              Tab(icon: Icon(Icons.edit)),

            ],
          ),
          backgroundColor: Colors.grey[50],
          elevation: 0.0,
        ),
        body: TabBarView(
          children: [
            GefuhleScreen(),
            GefuhleScreen(),
          ],
        ),
      ),
    );
  }
}

class GPCards {
  GP gP;

  GPCards({gP});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(getTitle(gP),),
    );
  }
}

String getTitle(GP gP){
  if (gP.istGefuhl==true)
    switch(gP.wert){
      case 0: return "Sehr Gut";
      case 1: return "Gut";
      case 2: return "Normal";
      case 3: return "Schlecht";
      case 4: return "Sehr Schlecht";
    }
    else
    switch(gP.wert){
      case 0: return "Sehr Produktiv";
      case 1: return "Produktiv";
      case 2: return "Normal";
      case 3: return "Wenig Produktiv";
      case 4: return "Gar nicht Produktiv";
    }
}

class GefuhleScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: getGefuhle().length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 35),
          title: Text(getGefuhle()[index].tag.day.toString() + "." + getGefuhle()[index].tag.month.toString()  + "." + getGefuhle()[index].tag.year.toString(),
          style: TextStyle(fontSize: 18.0),),
          subtitle: Text(getTitle(getGefuhle()[index]),),
          trailing: Container(
            height: 30.0,
            width: 150.0,
            decoration: BoxDecoration(
                color: getColor(getGefuhle()[index].wert),
                borderRadius: BorderRadius.all(const Radius.circular(10.0))),
          ),
        );
      },
    );
  }
}

Color getColor(int wert){
    switch(wert){
      case 0: return Colors.green;
      case 1: return Colors.lightGreenAccent;
      case 2: return Colors.yellow;
      case 3: return Colors.orange;
      case 4: return Colors.red;
    }

}