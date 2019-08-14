import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:aaproto2/ThemeData.dart';


// Für den Prototypen einfach GefuhlTrackerWidget kopiert


enum ProduktivitatOptionen { sehrgut, gut, normal, schlecht, sehrschlecht }



class ProduktivitatTrackerWidget extends StatefulWidget {
  ProduktivitatTrackerWidget({Key key}) : super(key: key);

  @override
  State createState() => ProduktivitatTrackerWidgetState();
}

class ProduktivitatTrackerWidgetState extends State<ProduktivitatTrackerWidget> {

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
      padding: EdgeInsets.symmetric(horizontal: 10.0),
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
            builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.edit, color: Colors.black, size: 37.5,),
                    title: Text("Wie produktiv\nwarst du Heute?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.event,
                        size: 25.0,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/TrackerKalenderScreen");
                      },
                    ),
                  ),
                  Expanded(
                    child: IconTheme(
                      data: IconThemeData(
                        size: 128.0,
                        color: Theme.of(context).highlightColor,
                      ),
                      child: TabBarView(children: gefuhlsWidgets),
                    ),
                  ),
                  TabPageSelector(selectedColor: AAThemeData.primaryColor,),
                ],
              ),
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

  ProduktivitatOptionen _gefuhle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RadioListTile<ProduktivitatOptionen>(
            title: const Text('Sehr Produktiv', style: TextStyle(fontSize: 16.0),),
            value: ProduktivitatOptionen.sehrgut,
            groupValue: _gefuhle,
            secondary: Container(
              height: 30.0,
              width: 150.0,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))
              ),
            ),
            onChanged: (ProduktivitatOptionen value) {
              setState(() {
                _gefuhle = value;
              });
            },
          ),
          RadioListTile<ProduktivitatOptionen>(
            title: const Text('Produktiv', style: TextStyle(fontSize: 16.0),),
            value: ProduktivitatOptionen.gut,
            groupValue: _gefuhle,
            secondary: Container(
              height: 30.0,
              width: 150.0,
              decoration: BoxDecoration(
                  color: Colors.lightGreenAccent,
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))
              ),
            ),
            onChanged: (ProduktivitatOptionen value) {
              setState(() {
                _gefuhle = value;
              });
            },
          ),
          RadioListTile<ProduktivitatOptionen>(
            title: const Text('Normal', style: TextStyle(fontSize: 16.0),),
            value: ProduktivitatOptionen.normal,
            groupValue: _gefuhle,
            secondary: Container(
              height: 30.0,
              width: 150.0,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))
              ),
            ),
            onChanged: (ProduktivitatOptionen value) {
              setState(() {
                _gefuhle = value;
              });
            },
          ),
          RadioListTile<ProduktivitatOptionen>(
            title: const Text('Wenig Produktiv', style: TextStyle(fontSize: 16.0),),
            value: ProduktivitatOptionen.schlecht,
            groupValue: _gefuhle,
            secondary: Container(
              height: 30.0,
              width: 150.0,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))
              ),
            ),
            onChanged: (ProduktivitatOptionen value) {
              setState(() {
                _gefuhle = value;
              });
            },
          ),
          RadioListTile<ProduktivitatOptionen>(
            title: const Text('Gar Nicht Produktiv', style: TextStyle(fontSize: 16.0),),
            value: ProduktivitatOptionen.sehrschlecht,
            groupValue: _gefuhle,
            secondary: Container(
              height: 30.0,
              width: 150.0,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))
              ),
            ),
            onChanged: (ProduktivitatOptionen value) {
              setState(() {
                _gefuhle = value;
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

  PointsLineChart(this.seriesList,{this.animate});

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