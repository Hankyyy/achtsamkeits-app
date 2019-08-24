import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';

import 'package:aaproto2/HomeScreen/QuickActionWidget.dart';
import 'package:aaproto2/HomeScreen/ZitatWidget.dart';
import 'package:aaproto2/HomeScreen/GefuhlTrackerWidget.dart';
import 'package:aaproto2/HomeScreen/ProduktivitatTrackerWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      //padding: EdgeInsets.all(10.0),
      children: <Widget>[
        QAWidget(),
        ZitatWidget(),
        GefuhlTrackerWidget(),
        ProduktivitatTrackerWidget(),
        SizedBox(height: 10,),
      ],
    );
  }
}
