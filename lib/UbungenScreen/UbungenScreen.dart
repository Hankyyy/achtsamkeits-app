import 'package:flutter/material.dart';

import 'UbungenUtils.dart';
import 'UbungenDetailScreen.dart';

class UbungenScreen extends StatefulWidget {
  @override
  _UbungenScreenState createState() => _UbungenScreenState();
}

class _UbungenScreenState extends State<UbungenScreen> {
  List<Ubung> ubungen;

  @override
  void initState() {
    ubungen = getUbungen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Übungen',
          style: TextStyle(
              fontSize: 30.0, color: Theme.of(context).textTheme.title.color),
        ),
        backgroundColor: Theme.of(context).appBarTheme.color,
        actions: <Widget>[],
        elevation: 0.0,
      ),
      body: GridView.count(
        padding: EdgeInsets.only(left: 16.5, right: 16.5, bottom: 17.5),
        crossAxisCount: 2,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: List.generate(
          ubungen.length,
          (index) {
            return MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              height: 170.0,
              color: Theme.of(context).buttonColor,
              textColor: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    ubungen[index].icon,
                    size: 75.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text(
                    ubungen[index].title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.title,
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UbungenDetailScreen(
                              ubung: ubungen[index],
                              index: index,
                            )));
              },
              splashColor: Theme.of(context).highlightColor,
            );
          },
        ),
      ),
    );
  }

  Widget getIcon(Ubung ubung) {
    if (ubung.iconPath == "")
      return Icon(
        ubung.icon,
        size: 75.0,
      );
    else
      return DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ubung.iconPath),
            // ...
          ),
          // ...
        ),
      );
  }
}

/*



 */
