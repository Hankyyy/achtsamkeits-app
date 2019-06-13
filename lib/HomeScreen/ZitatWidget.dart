import 'package:flutter/material.dart';

import 'package:aaproto2/ThemeData.dart';

class ZitatWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 40.0, bottom: 40.0,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "„Die Achtsamkeit aber, ihr Mönche, ist zu allem nützlich, sage ich.“",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0),
          ),
          Text(
            "- Buddha",
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
