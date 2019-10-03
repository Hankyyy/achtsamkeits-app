import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:ape_of_mind/Model/gefuehle.dart';

enum GefuhlOptionen { sehrgut, gut, normal, schlecht, sehrschlecht }

class GefuhlTrackerWidget extends StatefulWidget {
  GefuhlTrackerWidget({Key key}) : super(key: key);

  @override
  State createState() => GefuhlTrackerWidgetState();
}

class GefuhlTrackerWidgetState extends State<GefuhlTrackerWidget> {

  var gefuhlsWidgets = <Widget>[
    GefuhlFrageWidget(),
    LetztenSieben(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: DefaultTabController(
          length: gefuhlsWidgets.length,
          // Use a Builder here, otherwise `DefaultTabController.of(context)` below
          // returns null.
          child: Builder(
            builder: (BuildContext context) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.insert_emoticon,
                        color: Theme.of(context).textTheme.title.color,
                        size: 37.5,
                      ),
                      title: Text(
                        "Wie geht es dir Heute?",
                        style: Theme.of(context).textTheme.title,
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.assessment,
                          size: 25.0,
                          color: Theme.of(context).textTheme.title.color,
                        ),
                        tooltip: "Gefühlsstatistiken",
                        onPressed: () {
                          Navigator.pushNamed(
                              context, "/TrackerKalenderScreen");
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(children: gefuhlsWidgets),
                    ),
                    TabPageSelector(
                      selectedColor: Theme.of(context).textTheme.title.color,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}

class GefuhlFrageWidget extends StatefulWidget {
  GefuhlFrageWidget({Key key}) : super(key: key);

  @override
  State createState() => GefuhlFrageWidgetState();
}

class GefuhlFrageWidgetState extends State<GefuhlFrageWidget> {
  GefuhlOptionen _gefuhle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RadioListTile<GefuhlOptionen>(
            title: Text(
              'Sehr Gut',
              style: Theme.of(context).textTheme.body2,
            ),
            activeColor: Theme.of(context).primaryColor,
            value: GefuhlOptionen.sehrgut,
            groupValue: _gefuhle,
            secondary: Container(
              height: 30.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))),
            ),
            onChanged: (GefuhlOptionen value) {
              setState(
                () {
                  Gefuehle g = new Gefuehle();
                  g.datum = DateTime.now().year.toString() +
                      "." +
                      DateTime.now().month.toString() +
                      "." +
                      DateTime.now().day.toString();
                  g.gWert = 5;
                  g.insertGefuehle(g);
                  _gefuhle = value;
                },
              );
            },
          ),
          RadioListTile<GefuhlOptionen>(
            title: Text(
              'Gut',
              style: Theme.of(context).textTheme.body2,
            ),
            activeColor: Theme.of(context).primaryColor,
            value: GefuhlOptionen.gut,
            groupValue: _gefuhle,
            secondary: Container(
              height: 30.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: Colors.lightGreen[400],
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))),
            ),
            onChanged: (GefuhlOptionen value) {
              setState(
                () {
                  Gefuehle g = new Gefuehle();
                  g.datum = DateTime.now().year.toString() +
                      "." +
                      DateTime.now().month.toString() +
                      "." +
                      DateTime.now().day.toString();
                  g.gWert = 4;
                  g.insertGefuehle(g);
                  _gefuhle = value;
                },
              );
            },
          ),
          RadioListTile<GefuhlOptionen>(
            title: Text(
              'Normal',
              style: Theme.of(context).textTheme.body2,
            ),
            activeColor: Theme.of(context).primaryColor,
            value: GefuhlOptionen.normal,
            groupValue: _gefuhle,
            secondary: Container(
              height: 30.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))),
            ),
            onChanged: (GefuhlOptionen value) {
              setState(
                () {
                  Gefuehle g = new Gefuehle();
                  g.datum = DateTime.now().year.toString() +
                      "." +
                      DateTime.now().month.toString() +
                      "." +
                      DateTime.now().day.toString();
                  g.gWert = 3;
                  g.insertGefuehle(g);
                  _gefuhle = value;
                },
              );
            },
          ),
          RadioListTile<GefuhlOptionen>(
            title: Text(
              'Schlecht',
              style: Theme.of(context).textTheme.body2,
            ),
            activeColor: Theme.of(context).primaryColor,
            value: GefuhlOptionen.schlecht,
            groupValue: _gefuhle,
            secondary: Container(
              height: 30.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))),
            ),
            onChanged: (GefuhlOptionen value) {
              setState(
                () {
                  Gefuehle g = new Gefuehle();
                  g.datum = DateTime.now().year.toString() +
                      "." +
                      DateTime.now().month.toString() +
                      "." +
                      DateTime.now().day.toString();
                  g.gWert = 2;
                  g.insertGefuehle(g);
                  _gefuhle = value;
                },
              );
            },
          ),
          RadioListTile<GefuhlOptionen>(
            title: Text(
              'Sehr Schlecht',
              style: Theme.of(context).textTheme.body2,
            ),
            activeColor: Theme.of(context).primaryColor,
            value: GefuhlOptionen.sehrschlecht,
            groupValue: _gefuhle,
            secondary: Container(
              height: 30.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))),
            ),
            onChanged: (GefuhlOptionen value) {
              setState(
                () {
                  Gefuehle g = new Gefuehle();
                  g.datum = DateTime.now().year.toString() +
                      "." +
                      DateTime.now().month.toString() +
                      "." +
                      DateTime.now().day.toString();
                  g.gWert = 1;
                  g.insertGefuehle(g);
                  _gefuhle = value;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class LetztenSieben extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  var barColor;

  String color;

  Gefuehle gefuehl = Gefuehle();

  LetztenSieben({this.seriesList, this.animate});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: gefuehl.getGefuehleSort(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Trage deine Gefühle ein!"),
          );
        }
        List<Gefuehle> gef = snapshot.data ?? [];

        return charts.BarChart(
          [
            charts.Series<gefTemp, String>(
              id: 'Gefühle',
              colorFn: (gefTemp, __) => charts.MaterialPalette.green.shadeDefault,
              domainFn: (gefTemp sales, _) => sales.year,
              measureFn: (gefTemp sales, _) => sales.sales,
              data: getList(gef),
            )
          ],
          animate: animate,
          defaultRenderer: charts.BarRendererConfig(
              // By default, bar renderer will draw rounded bars with a constant
              // radius of 100.
              // To not have any rounded corners, use [NoCornerStrategy]
              // To change the radius of the bars, use [ConstCornerStrategy]
              cornerStrategy: const charts.ConstCornerStrategy(20)),
        );
      },
    );
  }

  List<gefTemp> getList(var gef) {
    List<gefTemp> eintrage = [];
    for (int i = 0; i < gef.length; i++) {
      eintrage.add(gefTemp(gef[i].datum, gef[i].gWert * 25));
    }
    return eintrage;
  }
}

/// Sample ordinal data type.
class gefTemp {
  final String year;
  final int sales;

  gefTemp(this.year, this.sales);
}
