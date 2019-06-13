import 'package:flutter/material.dart';

enum GefuhlOptionen { sehrgut, gut, normal, schlecht, sehrschlecht }

class ProduktivitatTrackerWidget extends StatefulWidget {
  ProduktivitatTrackerWidget({Key key}) : super(key: key);

  @override
  State createState() => ProduktivitatTrackerWidgetState();
}

class ProduktivitatTrackerWidgetState extends State<ProduktivitatTrackerWidget> {

  GefuhlOptionen _gefuhle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        //shape: ShapeBorder,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.edit, color: Colors.black, size: 37.5,),
              title: Text("Wie produktiv warst du Heute?", style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            RadioListTile<GefuhlOptionen>(
              title: const Text('Sehr Produktiv'),
              value: GefuhlOptionen.sehrgut,
              groupValue: _gefuhle,
              secondary: Container(
                height: 30.0,
                width: 150.0,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(const Radius.circular(10.0))
                ),
              ),
              onChanged: (GefuhlOptionen value) {
                setState(() {
                  _gefuhle = value;
                });
              },
            ),
            RadioListTile<GefuhlOptionen>(
              title: const Text('Produktiv'),
              value: GefuhlOptionen.gut,
              groupValue: _gefuhle,
              secondary: Container(
                height: 30.0,
                width: 150.0,
                decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.all(const Radius.circular(10.0))
                ),
              ),
              onChanged: (GefuhlOptionen value) {
                setState(() {
                  _gefuhle = value;
                });
              },
            ),
            RadioListTile<GefuhlOptionen>(
              title: const Text('Normal'),
              value: GefuhlOptionen.normal,
              groupValue: _gefuhle,
              secondary: Container(
                height: 30.0,
                width: 150.0,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(const Radius.circular(10.0))
                ),
              ),
              onChanged: (GefuhlOptionen value) {
                setState(() {
                  _gefuhle = value;
                });
              },
            ),
            RadioListTile<GefuhlOptionen>(
              title: const Text('Wenig Produktiv'),
              value: GefuhlOptionen.schlecht,
              groupValue: _gefuhle,
              secondary: Container(
                height: 30.0,
                width: 150.0,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(const Radius.circular(10.0))
                ),
              ),
              onChanged: (GefuhlOptionen value) {
                setState(() {
                  _gefuhle = value;
                });
              },
            ),
            RadioListTile<GefuhlOptionen>(
              title: const Text('Nicht Produktiv'),
              value: GefuhlOptionen.sehrschlecht,
              groupValue: _gefuhle,
              secondary: Container(
                height: 30.0,
                width: 150.0,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(const Radius.circular(10.0))
                ),
              ),
              onChanged: (GefuhlOptionen value) {
                setState(() {
                  _gefuhle = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

