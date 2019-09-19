import 'package:flutter/material.dart';


class ButtonWidget extends StatefulWidget {
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  double _qaButtonHeight = 115.0;
  double _qaButtonWidth = 120.0;
  double _quButtonIconSize = 55.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          SizedBox(height: 25,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: _qaButtonHeight,
                minWidth: _qaButtonWidth,
                color: Theme.of(context).buttonColor,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.watch_later,
                      size: _quButtonIconSize,
                      color: Theme.of(context).primaryColor,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text(
                      "Lern Timer", style: Theme.of(context).textTheme.button,
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/LernTimerScreen");
                },
                //splashColor: AAThemeData.buttonColor,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: _qaButtonHeight,
                minWidth: _qaButtonWidth,
                color: Theme.of(context).buttonColor,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.book,
                      size: _quButtonIconSize,
                      color: Theme.of(context).primaryColor,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text("Ratgeber", style: Theme.of(context).textTheme.button,)
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/RatgeberScreen");
                },
                //splashColor: AAThemeData.buttonColor,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: _qaButtonHeight,
                minWidth: _qaButtonWidth,
                color: Theme.of(context).buttonColor,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      size: _quButtonIconSize,
                      color: Theme.of(context).primaryColor,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text("Einstellungen", style: Theme.of(context).textTheme.button,)
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/EinstellungenScreen");
                },
                //splashColor: AAThemeData.buttonColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
