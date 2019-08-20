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

int ThemeOption = 0;

class getThemeClass {
  //int ThemeOption = 0;

  ThemeData getTheme() {
    switch(ThemeOption){
      case 0: return ThemeData(
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
      case 1: return ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        primaryColorBrightness: Brightness.light,
        accentColor: Colors.blue[900],
        accentColorBrightness: Brightness.light,
        buttonColor: Colors.blue,
        highlightColor: Colors.blue[900],
        backgroundColor: Colors.grey[50],
      );
      case 2: return ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        primaryColor: Colors.orange,
        primaryColorBrightness: Brightness.light,
        accentColor: Colors.orange[900],
        accentColorBrightness: Brightness.light,
        buttonColor: Colors.orange,
        highlightColor: Colors.orange[900],
        backgroundColor: Colors.grey[50],
      );
    }

  }
}



ThemeData getTheme() {
  switch(ThemeOption){
    case 0: return ThemeData(
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
    case 1: return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue,
      primaryColorBrightness: Brightness.light,
      accentColor: Colors.blue[900],
      accentColorBrightness: Brightness.light,
      buttonColor: Colors.blue,
      highlightColor: Colors.blue[900],
      backgroundColor: Colors.grey[50],
    );
    case 2: return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.orange,
      primaryColor: Colors.orange,
      primaryColorBrightness: Brightness.light,
      accentColor: Colors.orange[900],
      accentColorBrightness: Brightness.light,
      buttonColor: Colors.orange,
      highlightColor: Colors.orange[900],
      backgroundColor: Colors.grey[50],
    );
  }

}










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
