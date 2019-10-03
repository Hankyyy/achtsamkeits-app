import 'package:ape_of_mind/Model/meilenstein.dart';
import 'package:flutter/material.dart';

import 'ZieleUtils.dart';
import 'ZielCardWidget.dart';
import 'AddMeilensteinScreen.dart';

class ZieleScreen extends StatefulWidget {
  @override
  _ZieleScreenState createState() => _ZieleScreenState();
}

class _ZieleScreenState extends State<ZieleScreen> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ziele',
          style: TextStyle(
              fontSize: 30.0, color: Theme.of(context).textTheme.title.color),
        ),
        backgroundColor: Theme.of(context).appBarTheme.color,
        actions: <Widget>[],
        elevation: 0.0,
      ),
      body: FutureBuilder<List<Meilenstein_db>>(
        future: getMeilensteine(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Container();
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error!"),);
          }
          List<Meilenstein_db> meilensteine = snapshot.data ?? [];
          return ListView.builder(
            shrinkWrap: true,
            itemCount: meilensteine.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 10.0, left: 12.5, right: 12.5),
                child: ZielCard(
                  meilensteine[index],
                  index,
                  meilensteine.length,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddMeilensteinScreen()));
        },
        child: Icon(
          Icons.add,
          size: 35.0,
          color: Theme.of(context).accentTextTheme.title.color,
        ),
        tooltip: "Neuen Meilenstein erstellen",
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
