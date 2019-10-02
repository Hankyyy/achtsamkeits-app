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
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 3),
      new LinearSales(2, 2),
      new LinearSales(3, 4),
      new LinearSales(4, 1),
      new LinearSales(5, 1),
      new LinearSales(6, 2),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  var gefuhlsWidgets = <Widget>[
    GefuhlFrageWidget(),
    PointsLineChart(_createSampleData()),
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

class PointsLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  PointsLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory PointsLineChart.withSampleData() {
    return new PointsLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList,
        animate: animate,
        defaultRenderer: new charts.LineRendererConfig(includePoints: true));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 0),
      new LinearSales(1, 5),
      new LinearSales(2, 1),
      new LinearSales(3, 5),
      new LinearSales(4, 4),
      new LinearSales(5, 2),
      new LinearSales(6, 4),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
