import 'package:flutter/material.dart';

import 'package:ape_of_mind/Model/gefuehle.dart';
import 'package:ape_of_mind/Model/produktivitaet.dart';

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
            indicatorColor: Theme.of(context).highlightColor,
            tabs: [
              Tab(
                  icon: Icon(
                Icons.insert_emoticon,
                color: Theme.of(context).textTheme.title.color,
              )),
              Tab(
                  icon: Icon(
                Icons.border_color,
                color: Theme.of(context).textTheme.title.color,
                    size: 20,
              )),
            ],
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
        body: TabBarView(
          children: [
            GefuhleScreen(),
            ProduktivitatsScreen(),
          ],
        ),
      ),
    );
  }
}

String getTitleG(Gefuehle gP) {
  switch (gP.gWert) {
    case 5:
      return "Sehr Gut";
    case 4:
      return "Gut";
    case 3:
      return "Normal";
    case 2:
      return "Schlecht";
    case 1:
      return "Sehr Schlecht";
  }
}

String getTitleP(Produktivitaet gP) {
  switch (gP.pWert) {
    case 5:
      return "Sehr Produktiv";
    case 4:
      return "Produktiv";
    case 3:
      return "Normal";
    case 2:
      return "Wenig Produktiv";
    case 1:
      return "Gar nicht Produktiv";
  }
}

class GefuhleScreen extends StatelessWidget {
  Gefuehle gef = new Gefuehle();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Gefuehle>>(
      future: gef.getGefuehle(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text("Error!"),
          );
        }
        List<Gefuehle> gfl = snapshot.data ?? [];
        return ListView.builder(
          itemCount: gfl.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 35),
              title: Text(
                gfl[index].datum,
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(
                getTitleG(gfl[index]),
              ),
              trailing: Container(
                height: 30.0,
                width: 150.0,
                decoration: BoxDecoration(
                    color: getColor(gfl[index].gWert),
                    borderRadius:
                        BorderRadius.all(const Radius.circular(10.0))),
              ),
            );
          },
        );
      },
    );
  }
}

class ProduktivitatsScreen extends StatelessWidget {

  Produktivitaet prod = new Produktivitaet();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Produktivitaet>>(
      future: prod.getProduktivitaet(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: Container(),
          );
        }
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text("Error!"),
          );
        }
        List<Produktivitaet> gpl = snapshot.data ?? [];
        return ListView.builder(
          itemCount: gpl.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 35),
              title: Text(
                gpl[index].datum,
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(
                getTitleP(gpl[index]),
              ),
              trailing: Container(
                height: 30.0,
                width: 150.0,
                decoration: BoxDecoration(
                    color: getColor(gpl[index].pWert),
                    borderRadius:
                        BorderRadius.all(const Radius.circular(10.0))),
              ),
            );
          },
        );
      },
    );
  }
}

Color getColor(int wert) {
  switch (wert) {
    case 5:
      return Colors.green;
    case 4:
      return Colors.lightGreen[400];
    case 3:
      return Colors.yellow;
    case 2:
      return Colors.orange;
    case 1:
      return Colors.red;
  }
}
