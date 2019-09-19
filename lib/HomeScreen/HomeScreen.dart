import 'package:flutter/material.dart';

import 'ZitatWidget.dart';
import 'ButtonWidget.dart';
import 'GefuhlTrackerWidget.dart';
import 'ProduktivitatTrackarWidget.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 12.5,
      ),
      children: <Widget>[
        SizedBox(
          height: 25,
        ),
        ButtonWidget(),
        SizedBox(
          height: 15,
        ),
        ZitatWidget(),
        SizedBox(
          height: 12.5,
        ),
        GefuhlTrackerWidget(),
        ProduktivitatTrackerWidget(),
        SizedBox(
          height: 12.5,
        ),
      ],
    );
  }
}
