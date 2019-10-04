import 'package:flutter/material.dart';
import 'package:ape_of_mind/Model/aufgaben.dart';

import 'package:auto_size_text/auto_size_text.dart';

class AddAufgabeScreen extends StatefulWidget {
  final String meilensteinTitle;

  AddAufgabeScreen(this.meilensteinTitle);

  @override
  _AddAufgabeScreenState createState() =>
      _AddAufgabeScreenState(meilensteinTitle);
}

class _AddAufgabeScreenState extends State<AddAufgabeScreen> {
  String meilensteinTitle;
  final afTitel = TextEditingController();

  _AddAufgabeScreenState(this.meilensteinTitle);

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(
        () {
          selectedDate = picked;
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Aufgabe hinzufügen',
          style: TextStyle(
              fontSize: 30.0, color: Theme.of(context).textTheme.title.color),
        ),
        backgroundColor: Theme.of(context).appBarTheme.color,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            size: 30.0,
          ),
          color: Theme.of(context).textTheme.title.color,
          tooltip: "Abbrechen",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  child: ListView(
                    shrinkWrap: true,
                    primary: false,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Meilenstein:',
                            style: Theme.of(context).textTheme.body2,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text(
                              meilensteinTitle,
                              style: Theme.of(context).textTheme.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 25.0),
                      ),
                      TextFormField(
                        controller: afTitel,
                        decoration: InputDecoration(
                          labelText: "Titel",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 25.0),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Erledigen bis:',
                            style: Theme.of(context).textTheme.body2,
                          ),
                          OutlineButton(
                            onPressed: () => _selectDate(context),
                            highlightedBorderColor:
                                Theme.of(context).primaryColor,
                            child: Text("${selectedDate.year.toString()}" +
                                "."
                                    "${selectedDate.month.toString()}" +
                                "."
                                    "${selectedDate.day.toString()}"),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //minWidth: MediaQuery.of(context).size.width-40,
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Hinzufügen",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).accentTextTheme.title,
                  )
                ],
              ),
              onPressed: () async {
                var af = new Aufgaben();
                af.titel = afTitel.text;
                af.datum = ("${selectedDate.year.toString()}" +
                    "."
                        "${selectedDate.month.toString()}" +
                    "."
                        "${selectedDate.day.toString()}");
                af.erledigt = 0;
                af.meilenstein_id = meilensteinTitle;
                await af.insertAufgabe(af);
                Navigator.pop(context);
              },
              splashColor: Theme.of(context).highlightColor,
            ),
          ),
        ],
      ),
    );
  }
}
