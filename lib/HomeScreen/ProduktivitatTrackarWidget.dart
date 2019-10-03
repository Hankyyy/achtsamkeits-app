import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:ape_of_mind/Model/produktivitaet.dart';

enum ProduktivitatOptionen { sehrgut, gut, normal, schlecht, sehrschlecht }

class ProduktivitatTrackerWidget extends StatefulWidget {
  ProduktivitatTrackerWidget({Key key}) : super(key: key);

  @override
  State createState() => ProduktivitatTrackerWidgetState();
}

class ProduktivitatTrackerWidgetState
    extends State<ProduktivitatTrackerWidget> {


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
                        Icons.edit,
                        color: Theme.of(context).textTheme.title.color,
                        size: 37.5,
                      ),
                      title: Text(
                        "Wie produktiv\nwarst du Heute?",
                        style: Theme.of(context).textTheme.title,
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.assessment,
                          size: 25.0,
                          color: Theme.of(context).textTheme.title.color,
                        ),
                        tooltip: "Produktivitätsstatistiken",
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
                        selectedColor: Theme.of(context).textTheme.title.color),
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
  ProduktivitatOptionen _produktivitat;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RadioListTile<ProduktivitatOptionen>(
            title: Text('Sehr Produktiv',
                style: Theme.of(context).textTheme.body2),
            activeColor: Theme.of(context).primaryColor,
            value: ProduktivitatOptionen.sehrgut,
            groupValue: _produktivitat,
            secondary: Container(
              height: 30.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))),
            ),
            onChanged: (ProduktivitatOptionen value) {
              setState(() {
                Produktivitaet p = new Produktivitaet();
                p.datum = DateTime.now().year.toString() +
                    "." +
                    DateTime.now().month.toString() +
                    "." +
                    DateTime.now().day.toString();
                p.pWert = 5;
                p.insertProduktivitaet(p);
                _produktivitat = value;
              });
            },
          ),
          RadioListTile<ProduktivitatOptionen>(
            title: Text(
              'Produktiv',
              style: Theme.of(context).textTheme.body2,
            ),
            activeColor: Theme.of(context).primaryColor,
            value: ProduktivitatOptionen.gut,
            groupValue: _produktivitat,
            secondary: Container(
              height: 30.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: Colors.lightGreen[400],
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))),
            ),
            onChanged: (ProduktivitatOptionen value) {
              setState(() {
                Produktivitaet p = new Produktivitaet();
                p.datum = DateTime.now().year.toString() +
                    "." +
                    DateTime.now().month.toString() +
                    "." +
                    DateTime.now().day.toString();
                p.pWert = 4;
                p.insertProduktivitaet(p);
                _produktivitat = value;
              });
            },
          ),
          RadioListTile<ProduktivitatOptionen>(
            title: Text(
              'Normal',
              style: Theme.of(context).textTheme.body2,
            ),
            activeColor: Theme.of(context).primaryColor,
            value: ProduktivitatOptionen.normal,
            groupValue: _produktivitat,
            secondary: Container(
              height: 30.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))),
            ),
            onChanged: (ProduktivitatOptionen value) {
              setState(() {
                Produktivitaet p = new Produktivitaet();
                p.datum = DateTime.now().year.toString() +
                    "." +
                    DateTime.now().month.toString() +
                    "." +
                    DateTime.now().day.toString();
                p.pWert = 3;
                p.insertProduktivitaet(p);
                _produktivitat = value;
              });
            },
          ),
          RadioListTile<ProduktivitatOptionen>(
            title: Text(
              'Wenig Produktiv',
              style: Theme.of(context).textTheme.body2,
            ),
            activeColor: Theme.of(context).primaryColor,
            value: ProduktivitatOptionen.schlecht,
            groupValue: _produktivitat,
            secondary: Container(
              height: 30.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))),
            ),
            onChanged: (ProduktivitatOptionen value) {
              setState(() {
                Produktivitaet p = new Produktivitaet();
                p.datum = DateTime.now().year.toString() +
                    "." +
                    DateTime.now().month.toString() +
                    "." +
                    DateTime.now().day.toString();
                p.pWert = 2;
                p.insertProduktivitaet(p);
                _produktivitat = value;
              });
            },
          ),
          RadioListTile<ProduktivitatOptionen>(
            title: Text(
              'Gar Nicht Produktiv',
              style: Theme.of(context).textTheme.body2,
            ),
            activeColor: Theme.of(context).primaryColor,
            value: ProduktivitatOptionen.sehrschlecht,
            groupValue: _produktivitat,
            secondary: Container(
              height: 30.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))),
            ),
            onChanged: (ProduktivitatOptionen value) {
              setState(() {
                Produktivitaet p = new Produktivitaet();
                p.datum = DateTime.now().year.toString() +
                    "." +
                    DateTime.now().month.toString() +
                    "." +
                    DateTime.now().day.toString();
                p.pWert = 1;
                p.insertProduktivitaet(p);
                _produktivitat = value;
              });
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

  Produktivitaet produktivitaet = Produktivitaet();

  LetztenSieben({this.seriesList, this.animate});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: produktivitaet.getProduktivitaetSort(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Trage deine Produktivität ein!"),
          );
        }
        List<Produktivitaet> pro = snapshot.data ?? [];

        return charts.BarChart(
          [
            charts.Series<proTemp, String>(
              id: 'Produktivität',
              colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
              domainFn: (proTemp sales, _) => sales.year,
              measureFn: (proTemp sales, _) => sales.sales,
              data: getList(pro),
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

  List<proTemp> getList(var gef) {
    List<proTemp> eintrage = [];
    for (int i = 0; i < gef.length; i++) {
      eintrage.add(proTemp(gef[i].datum, gef[i].pWert * 25));
    }
    return eintrage;
  }

}

/// Sample ordinal data type.
class proTemp {
  final String year;
  final int sales;

  proTemp(this.year, this.sales);
}