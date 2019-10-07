import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import 'BottomNavBarWidget/BottomNavBarWidget.dart';
import 'package:ape_of_mind/EinstellungenScreen/EinstellungenScreen.dart';
import 'package:ape_of_mind/Theme/Theme.dart';
import 'package:ape_of_mind/RatgeberScreen/RatgeberScreen.dart';
import 'package:ape_of_mind/LernTimerScreen/LernTimerScreen.dart';
import 'package:ape_of_mind/TrackerKalenderScreen/TrackerKalenderScreen.dart';
import 'package:ape_of_mind/Model/theme.dart';

void main() => runApp(APE());

class APE extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    ApeTheme theme = ApeTheme();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return FutureBuilder(
      future: theme.getThemeInt(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Container(
            color: Colors.white,
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Error!"),
          );
        }

        int i = snapshot.data;

        return DynamicTheme(
          defaultBrightness: Brightness.light,
          data: (brightness) => getTheme(i),
          themedWidgetBuilder: (context, theme) {
            return MaterialApp(
              locale: const Locale('de', 'DE'),
              title: 'Ape of Mind',
              theme: theme,
              home: BottomNavBarWidget(),
              debugShowCheckedModeBanner: false,
              routes: {
                "/EinstellungenScreen": (context) => EinstellungenScreen(),
                "/RatgeberScreen": (context) => RatgeberScreen(),
                "/LernTimerScreen": (context) => LernTimerScreen(),
                "/TrackerKalenderScreen": (context) => TrackerKalenderScreen(),
                "/BottomNavBarWidget": (context) => BottomNavBarWidget(),
              },
            );
          },
        );
      },
    );
  }
}