import 'package:flutter/material.dart';


//Themes

ThemeData getTheme(int i){
  switch(i){
    case 0: return grun; break;
    case 1: return aquamarin; break;
    case 2: return limette; break;
    case 3: return bernstein; break;
    case 4: return lila; break;
    case 5: return indigo; break;
    case 6: return cyan; break;
    case 7: return blaugrau; break;
    case 8: return darkTheme; break;

  }
}

List<ThemeData> themes = [grun, aquamarin, limette, bernstein, lila, indigo, cyan, blaugrau, darkTheme];


ThemeData grun = ThemeData(
  primarySwatch: Colors.green,
  primaryColor: Colors.green,
  accentColor: Colors.green,
  highlightColor: Colors.green[200],
  buttonColor: Colors.white,
  cursorColor: Colors.green,
  bottomAppBarColor: Colors.black,
  appBarTheme: appBarTheme,
  textTheme: textTheme,
  accentTextTheme: whiteTextTheme,
  dialogTheme: dialogTheme,
);

ThemeData aquamarin = ThemeData(
  primarySwatch: Colors.teal,
  primaryColor: Colors.teal,
  accentColor: Colors.teal,
  highlightColor: Colors.teal[200],
  buttonColor: Colors.white,
  cursorColor: Colors.teal,
  bottomAppBarColor: Colors.black,
  appBarTheme: appBarTheme,
  textTheme: textTheme,
  accentTextTheme: whiteTextTheme,
  dialogTheme: dialogTheme,
);

ThemeData limette = ThemeData(
  primarySwatch: Colors.lime,
  primaryColor: Colors.lime,
  accentColor: Colors.lime,
  highlightColor: Colors.lime[200],
  buttonColor: Colors.white,
  cursorColor: Colors.lime,
  bottomAppBarColor: Colors.black,
  appBarTheme: appBarTheme,
  textTheme: textTheme,
  accentTextTheme: whiteTextTheme,
  dialogTheme: dialogTheme,
);

ThemeData bernstein = ThemeData(
  primarySwatch: Colors.amber,
  primaryColor: Colors.amber,
  accentColor: Colors.amber,
  highlightColor: Colors.amber[200],
  buttonColor: Colors.white,
  cursorColor: Colors.amber,
  bottomAppBarColor: Colors.black,
  appBarTheme: appBarTheme,
  textTheme: textTheme,
  accentTextTheme: whiteTextTheme,
  dialogTheme: dialogTheme,
);

ThemeData lila = ThemeData(
  primarySwatch: Colors.deepPurple,
  primaryColor: Colors.deepPurple,
  accentColor: Colors.deepPurple,
  highlightColor: Colors.deepPurple[200],
  buttonColor: Colors.white,
  cursorColor: Colors.deepPurple,
  bottomAppBarColor: Colors.black,
  appBarTheme: appBarTheme,
  textTheme: textTheme,
  accentTextTheme: whiteTextTheme,
  dialogTheme: dialogTheme,
);

ThemeData cyan = ThemeData(
  primarySwatch: Colors.cyan,
  primaryColor: Colors.cyan,
  accentColor: Colors.cyan,
  highlightColor: Colors.cyan[200],
  buttonColor: Colors.white,
  cursorColor: Colors.cyan,
  bottomAppBarColor: Colors.black,
  appBarTheme: appBarTheme,
  textTheme: textTheme,
  accentTextTheme: whiteTextTheme,
  dialogTheme: dialogTheme,
);

ThemeData indigo = ThemeData(
  primarySwatch: Colors.indigo,
  primaryColor: Colors.indigo,
  accentColor: Colors.indigo,
  highlightColor: Colors.indigo[200],
  buttonColor: Colors.white,
  cursorColor: Colors.indigo,
  bottomAppBarColor: Colors.black,
  appBarTheme: appBarTheme,
  textTheme: textTheme,
  accentTextTheme: whiteTextTheme,
  dialogTheme: dialogTheme,
);

ThemeData blaugrau = ThemeData(
  primarySwatch: Colors.blueGrey,
  primaryColor: Colors.blueGrey,
  accentColor: Colors.blueGrey,
  highlightColor: Colors.blueGrey[200],
  buttonColor: Colors.white,
  cursorColor: Colors.blueGrey,
  bottomAppBarColor: Colors.black,
  appBarTheme: appBarTheme,
  textTheme: textTheme,
  accentTextTheme: whiteTextTheme,
  dialogTheme: dialogTheme,
);



ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  accentColor: Colors.white,
  highlightColor: Colors.grey,
  buttonColor: Colors.grey[800],
  cursorColor: Colors.white,
  bottomAppBarColor: Colors.black,
  //hoverColor: Colors.grey[900],
  appBarTheme: darkAppBarTheme,
  textTheme: darkTextTheme,
  accentTextTheme: darkAccentTextTheme,
  dialogTheme: dialogTheme,
);

//LightTheme

AppBarTheme appBarTheme = AppBarTheme(
  brightness: Brightness.light,
  textTheme: TextTheme(
      title: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
  color: Colors.grey[50],
);

TextTheme whiteTextTheme = TextTheme(
  title: TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  ),
  body1: TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    //fontWeight: FontWeight.bold,
  ),
  body2: TextStyle(
    color: Colors.white,
    fontSize: 16.0,
  ),
);

TextTheme textTheme = TextTheme(
  title: TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  ),
  subtitle: TextStyle(
    color: Colors.black,
    fontSize: 14.0,
  ),
  body1: TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    //fontWeight: FontWeight.bold,
  ),
  body2: TextStyle(
    color: Colors.black,
    fontSize: 16.0,
  ),
  button: TextStyle(
    color: Colors.black,
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  ),
  caption: TextStyle(
    color: Colors.black54,
    fontSize: 16.0,
  ),
  overline: TextStyle(
    color: Colors.black26,
    fontSize: 16.0,
  ),
);

//DarkTheme

AppBarTheme darkAppBarTheme = AppBarTheme(
  brightness: Brightness.dark,
  color: Colors.grey[850],
  //textTheme: TextTheme(title: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
);

DialogTheme dialogTheme = DialogTheme(
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0))),
);

TextTheme darkTextTheme = TextTheme(
  title: TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  ),
  subtitle: TextStyle(
    color: Colors.white,
    fontSize: 14.0,
  ),
  body1: TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    //fontWeight: FontWeight.bold,
  ),
  body2: TextStyle(
    color: Colors.white,
    fontSize: 16.0,
  ),
  button: TextStyle(
    color: Colors.white,
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  ),
  caption: TextStyle(
    color: Colors.white,
    fontSize: 16.0,
  ),
  overline: TextStyle(
    color: Colors.grey[400],
    fontSize: 16.0,
  ),
);

TextTheme darkAccentTextTheme = TextTheme(
  title: TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  ),
  subtitle: TextStyle(
    color: Colors.black,
    fontSize: 14.0,
  ),
  body1: TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    //fontWeight: FontWeight.bold,
  ),
  body2: TextStyle(
    color: Colors.black,
    fontSize: 16.0,
  ),
  button: TextStyle(
    color: Colors.black,
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  ),
  caption: TextStyle(
    color: Colors.black,
    fontSize: 16.0,
  ),
  overline: TextStyle(
    color: Colors.grey[400],
    fontSize: 16.0,
  ),
);













/*



 */
