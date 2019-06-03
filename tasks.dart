import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:achtsamkeit/tracking.dart';

class Tasks extends StatelessWidget{
  @override
  final primcolor = const Color(0xffb2ebf2);
  Widget build(BuildContext context){
    return new Scaffold(
      body:
      Column(children: <Widget>[
        Row( //Row2
          children: [
            Container(
              child: Expanded(
                  child: Image.asset('assets/brainwings.png')
              ),
            ),
          ],
        ),
        Row( //Row2
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Padding(padding: EdgeInsets.symmetric(vertical: 80.0)),
            ButtonTheme(
              height: 120.0,
              child: RaisedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                child: Text('Disabled Button', style: TextStyle(fontSize: 20)),
                color: primcolor,
              ),
            ),
            ButtonTheme(
              height: 120.0,
              child: RaisedButton(
                onPressed: (){},
                child: Text('Disabled Button', style: TextStyle(fontSize: 20)),
                color: primcolor,
              ),
            ),
          ],
        ),
        Row( //Row2
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ButtonTheme(
              height: 120.0,
              child: RaisedButton(
                onPressed: (){},
                child: Text('Disabled Button', style: TextStyle(fontSize: 20)),
                color: primcolor,
              ),
            ),
            ButtonTheme(
              height: 120.0,
              child: RaisedButton(
                onPressed: (){},
                child: Text('Disabled Button', style: TextStyle(fontSize: 20)),
                color: primcolor,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}




