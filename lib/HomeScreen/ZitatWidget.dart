import 'package:flutter/material.dart';

import 'ZitatWidgetUtils.dart';

class ZitatWidget extends StatefulWidget {
  @override
  _ZitatWidgetState createState() => _ZitatWidgetState();
}

class _ZitatWidgetState extends State<ZitatWidget> {
  var _zitat = (zitatList()..shuffle()).first;
  var _newZitat = Zitat();
  int i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Theme.of(context).highlightColor,
      borderRadius: BorderRadius.circular(10),
      onLongPress: () {
        i = 0;
        while (i == 0) {
          _newZitat = (zitatList()..shuffle()).first;
          if (_zitat.inhalt != _newZitat.inhalt)
            setState(
              () {
                _zitat = _newZitat;
                i = 1;
              },
            );
        }
      },
      child: Card(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 10),
          child: ListTile(
            title: Text(
              "„" + _zitat.inhalt + "“",
              textAlign: TextAlign.start,
              style: Theme.of(context).accentTextTheme.title,
            ),
            subtitle: Text(
              "- " + _zitat.autor,
              textAlign: TextAlign.end,
              style: Theme.of(context).accentTextTheme.body2,
            ),
          ),
        ),
      ),
    );
  }
}


