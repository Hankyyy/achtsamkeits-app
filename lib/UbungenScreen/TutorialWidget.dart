import 'package:flutter/material.dart';
import 'package:aaproto2/UbungenScreen/Ubungen/ReturnIconWidget.dart';
import 'package:aaproto2/ThemeData.dart';

class TTWidget extends StatefulWidget {
  @override
  _TTWidgetState createState() => _TTWidgetState();
}


class _TTWidgetState extends State<TTWidget> {
  double _qaButtonHeight = 140.0;
  double _qaButtonWidth = 170.0;
  double _quButtonIconSize = 75.0;

  Widget build(BuildContext context) {
    return Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    height: _qaButtonHeight,
                    minWidth: _qaButtonWidth,
                    color: AAThemeData.buttonColor,
                    textColor: Colors.white,

                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.settings_input_antenna,
                        size: _quButtonIconSize,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5.0),
                      ),
                      Text(
                        "Atem-Anker",
                      )
                    ],
                  ),

                    onPressed: () =>{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RIWidget())
                    )
                    },
                    splashColor: AAThemeData.highlightColor,
                  ),


                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  height: _qaButtonHeight,
                  minWidth: _qaButtonWidth,
                  color: AAThemeData.buttonColor,
                  textColor: Colors.white,

                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.settings_input_antenna,
                        size: _quButtonIconSize,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5.0),
                      ),
                      Text(
                        "Meditation",
                      )
                    ],
                  ),

                  onPressed: () =>{
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RIWidget())
                  )
                  },
                  splashColor: AAThemeData.highlightColor,
                ),


              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 15.0),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  height: _qaButtonHeight,
                  minWidth: _qaButtonWidth,
                  color: AAThemeData.buttonColor,
                  textColor: Colors.white,

                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.settings_input_antenna,
                        size: _quButtonIconSize,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5.0),
                      ),
                      Text(
                        "LernTimer",
                      )
                    ],
                  ),

                  onPressed: () =>{
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RIWidget())
                  )
                  },
                  splashColor: AAThemeData.highlightColor,
                ),


                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  height: _qaButtonHeight,
                  minWidth: _qaButtonWidth,
                  color: AAThemeData.buttonColor,
                  textColor: Colors.white,

                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.settings_input_antenna,
                        size: _quButtonIconSize,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5.0),
                      ),
                      Text(
                        "not chosen yet",
                      )
                    ],
                  ),

                  onPressed: () =>{
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RIWidget())
                  )
                  },
                  splashColor: AAThemeData.highlightColor,
                ),


              ],
            ),
          ],)
    );
  }
}