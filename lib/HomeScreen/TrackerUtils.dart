import 'package:flutter/material.dart';

class GP {
  int wert;
  DateTime tag;
  bool istGefuhl = false;

  GP({this.wert, this.tag, this.istGefuhl});
}


List<GP> getGefuhle() {
  return [
    GP(
        wert: 3,
        tag: DateTime(2019, 08, 01),
      istGefuhl: true,
    ),
    GP(
        wert: 1,
        tag: DateTime(2019, 08, 02),
      istGefuhl: true,
    ),
    GP(
        wert: 4,
        tag: DateTime(2019, 08, 03),
      istGefuhl: true,
    ),
    GP(
        wert: 1,
        tag: DateTime(2019, 08, 04),
      istGefuhl: true,
    ),
    GP(
        wert: 0,
        tag: DateTime(2019, 08, 05),
      istGefuhl: true,
    ),
    GP(
        wert: 2,
        tag: DateTime(2019, 08, 06),
      istGefuhl: true,
    ),
    GP(
        wert: 3,
        tag: DateTime(2019, 08, 07),
      istGefuhl: true,
    ),
    GP(
        wert: 0,
        tag: DateTime(2019, 08, 08),
      istGefuhl: true,
    ),
    GP(
        wert: 4,
        tag: DateTime(2019, 08, 09),
      istGefuhl: true,
    ),
    GP(
        wert: 4,
        tag: DateTime(2019, 08, 10),
      istGefuhl: true,
    ),
    GP(
        wert: 2,
        tag: DateTime(2019, 08, 11),
      istGefuhl: true,
    ),
    GP(
        wert: 0,
        tag: DateTime(2019, 08, 12),
      istGefuhl: true,
    ),
  ];
}

List<GP> getProduktivitat() {
  return [
    GP(
        wert: 3,
        tag: DateTime(2019, 08, 01)
    ),
    GP(
        wert: 1,
        tag: DateTime(2019, 08, 02)
    ),
    GP(
        wert: 4,
        tag: DateTime(2019, 08, 03)
    ),
    GP(
        wert: 1,
        tag: DateTime(2019, 08, 04)
    ),
    GP(
        wert: 0,
        tag: DateTime(2019, 08, 05)
    ),
    GP(
        wert: 2,
        tag: DateTime(2019, 08, 06)
    ),
    GP(
        wert: 3,
        tag: DateTime(2019, 08, 07)
    ),
    GP(
        wert: 0,
        tag: DateTime(2019, 08, 08)
    ),
    GP(
        wert: 4,
        tag: DateTime(2019, 08, 09)
    ),
    GP(
        wert: 4,
        tag: DateTime(2019, 08, 10)
    ),
    GP(
        wert: 2,
        tag: DateTime(2019, 08, 11)
    ),
    GP(
        wert: 0,
        tag: DateTime(2019, 08, 12)
    ),
  ];
}