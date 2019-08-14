import 'package:flutter/material.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:aaproto2/ThemeData.dart';
import 'package:aaproto2/ZieleScreen/ZieleUtils.dart';

class ZielCard extends StatefulWidget {
  ZielCard(this.meilenstein, this.i, this.length);

  Meilenstein meilenstein;
  int i;
  int length;


  @override
  _ZielCardState createState() => _ZielCardState(meilenstein, i, length);
}

class _ZielCardState extends State<ZielCard> {
  _ZielCardState(this.meilenstein, this.i, this.length);

  Meilenstein meilenstein;
  int i;
  int length;

  int _getPadding(int i, int length) {
    if (i != length-1)
      return 0;
    else
      return 75;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: _getPadding(i, length).toDouble()),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              contentPadding:
              EdgeInsets.only(top: 10.0, left: 15.0, bottom: 10, right: 12.5),
              title: Text(
                meilenstein.title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Erledigen bis: " +
                      meilenstein.geplant.day.toString() +
                      "." +
                      meilenstein.geplant.month.toString() +
                      "." +
                      meilenstein.geplant.year.toString(),style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),),
                  Text("Deadline: " +
                      meilenstein.deadline.day.toString() +
                      "." +
                      meilenstein.deadline.month.toString() +
                      "." +
                      meilenstein.deadline.year.toString(),style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _addAufgabe(context);
                },
              ),
            ),
            _getNotizen(),
            LinearPercentIndicator(
              padding: EdgeInsets.symmetric(horizontal: 25),
              lineHeight: 15,
              backgroundColor: Colors.black12,
              progressColor: AAThemeData.primaryColor,
              percent: meilenstein.erledigteAufgaben.length /
                  (meilenstein.aufgaben.length +
                      meilenstein.erledigteAufgaben.length),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: meilenstein.aufgaben.length,
              itemBuilder: (context, index) {
                return Center(
                    child: CheckboxListTile(
                      value: false,
                      onChanged: null,
                      title: Text(
                        meilenstein.aufgaben[index].title,
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      subtitle: Text("Erledigen bis: " +
                          meilenstein.aufgaben[index].geplant.day.toString() +
                          "." +
                          meilenstein.aufgaben[index].geplant.month.toString() +
                          "." +
                          meilenstein.aufgaben[index].geplant.year.toString()),
                    ));
              },
            ),
            SizedBox(height: 10,),
            ExpansionTile(
              title: Text("Erledigte Aufgaben",style: TextStyle(color: Colors.black),),
              children: <Widget>[
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: meilenstein.erledigteAufgaben.length,
                  itemBuilder: (context, index) {
                    return Center(
                        child: CheckboxListTile(
                          value: true,
                          onChanged: null,
                          activeColor: Colors.grey,
                          title: Text(
                            meilenstein.erledigteAufgaben[index].title,
                            style: TextStyle(color: Colors.grey, fontSize: 16.0),
                          ),
                        ));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _getNotizen() {
    if(meilenstein.notizen.isEmpty)
      return Container();
    else
      return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(bottom: 15, left: 15),
        child: Text(meilenstein.notizen,style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),),
      );
  }

  Future<void> _addAufgabe(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    String dropdownValue = 'Online Marketing';

    Future<Null> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
        });
    }

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Neue Aufgabe",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Container(
              width: 800,
              child: Form(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    TextFormField(
                      decoration: new InputDecoration(
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
                        Text('Meilenstein:'),
                        Container(
                          padding: EdgeInsets.only(left: 20.0, right: 15.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[350]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            underline: Container(),
                            elevation: 1,
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>[
                              'Online Marketing',
                              'Medienproduktion',
                              'Führen im IT-Umfeld',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 25.0),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Erledigen bis:'),
                        SizedBox(
                          width: 20.0,
                        ),
                        OutlineButton(
                          onPressed: () => _selectDate(context),
                          highlightedBorderColor: AAThemeData.primaryColor,
                          child: Text("${selectedDate.day.toString()}" +
                              "."
                                  "${selectedDate.month.toString()}" +
                              "."
                                  "${selectedDate.year.toString()}"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          actions: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              color: Colors.white,
              child: Text(
                "Abbrechen",
                style:
                    TextStyle(fontSize: 16.0, color: AAThemeData.primaryColor),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Text(
                "Bestätigen",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}
