import 'package:flutter/material.dart';

final ThemeData AAThemeData = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.green,
  primaryColor: Colors.green,
  primaryColorBrightness: Brightness.light,
  accentColor: Colors.green[900],
  accentColorBrightness: Brightness.light,
  buttonColor: Colors.green,
  highlightColor: Colors.green[900],
  backgroundColor: Colors.grey[50],
);

class APETheme {
  Brightness brightness;
  MaterialColor primarySwatch;

  APETheme({
    this.brightness,
    this.primarySwatch,
  });
}

class AppTheme {
  String name;
  APETheme theme;

  AppTheme(this.name, this.theme);
}

List<AppTheme> myThemes = [
  AppTheme(
      'Grün',
      APETheme(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      )),
  AppTheme(
    'Blau',
    APETheme(
      brightness: Brightness.light,
      primarySwatch: Colors.teal,
    ),
  ),
  AppTheme(
    'Orange',
    APETheme(
      brightness: Brightness.light,
      primarySwatch: Colors.orange,
    ),
  ),
];

/*



*/
