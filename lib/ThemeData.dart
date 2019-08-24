import 'package:flutter/material.dart';

final ThemeData AAThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.green,
  primaryColorBrightness: Brightness.light,
  accentColor: Colors.green,
  accentColorBrightness: Brightness.light,

  highlightColor: Colors.green[200],

  buttonColor: Colors.white,
  backgroundColor: Colors.grey[50],

);

final TextStyle aABlackBold = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final TextStyle aABlackReg = TextStyle(
  fontSize: 16.0,
  color: Colors.black,
);

final TextStyle aAGreySmall = TextStyle(
  fontSize: 14.0,
  color: Colors.black54,
);

final TextStyle aAWhiteBold = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

final TextStyle aAWhiteReg = TextStyle(
  fontSize: 16.0,
  color: Colors.white,
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
        accentColor: Colors.green[400],
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
