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
                  g.datum = DateTime.now().year.toString() + "." + DateTime.now().month.toString() + "." + DateTime.now().day.toString();
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
                  g.datum = DateTime.now().year.toString() + "." + DateTime.now().month.toString() + "." + DateTime.now().day.toString();
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
                  g.datum = DateTime
                      .now()
                      .year
                      .toString() + "." + DateTime
                      .now()
                      .month
                      .toString() + "." + DateTime
                      .now()
                      .day
                      .toString();
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
                  g.datum = DateTime.now().year.toString() + "." + DateTime.now().month.toString() + "." + DateTime.now().day.toString();
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
                  g.datum = DateTime.now().year.toString() + "." + DateTime.now().month.toString() + "." + DateTime.now().day.toString();
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

class PointsLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  PointsLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory PointsLineChart.withSampleData() {
    return PointsLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      seriesList,
      animate: animate,
      defaultRenderer: charts.LineRendererConfig(
        includePoints: true,
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      LinearSales(0, 0),
      LinearSales(1, 5),
      LinearSales(2, 1),
      LinearSales(3, 5),
      LinearSales(4, 4),
      LinearSales(5, 2),
      LinearSales(6, 4),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
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
