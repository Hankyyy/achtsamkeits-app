import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';

class PTWidget extends StatefulWidget {
   @override
  _PTWidgetState createState() => _PTWidgetState();
}

class _PTWidgetState extends State<PTWidget> {

  Widget build(BuildContext context) {
    // ...
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/wetgrass.png'),
          // ...
        ),
        // ...
      ),
    );
    // ...
  }

}

