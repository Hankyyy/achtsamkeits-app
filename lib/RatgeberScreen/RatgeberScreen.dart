import 'package:flutter/material.dart';

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
          style: TextStyle(fontSize: 30.0, color: Theme.of(context).textTheme.title.color),
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
      body: Center(
        child: Text(
          "Hier kommt\nder Ratgeber hin!",
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
