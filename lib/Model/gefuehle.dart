import 'package:ape_of_mind/Database/dbHelper.dart';
import 'package:sqflite/sqflite.dart';

class Gefuehle {
  //int id;
  int gWert;
  String datum;

  Gefuehle(
      {
      //this.id,
      this.gWert,
      this.datum});

  Map<String, dynamic> toMap() {
    return {
      'gWert': gWert,
      'datum': datum,
    };
  }

  Future<void> insertGefuehle(Gefuehle g) async {
    final Database db = await DB.instance.initDB();
    /*await db.insert(
      'gefuehle',
      g.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );*/
    print(g.datum);
    await db.rawInsert(
        "INSERT OR REPLACE INTO gefuehle(datum, gWert) VALUES (?, ?)",
        [g.datum, g.gWert]);
  }

  //liefert alle Einträge
  Future<List<Gefuehle>> getGefuehle() async {
    final Database db = await DB.instance.initDB();
    final List<Map<String, dynamic>> maps = await db.query('gefuehle', orderBy: "datum DESC");
    return List.generate(
      maps.length,
      (i) {
        return Gefuehle(
          gWert: maps[i]['gWert'],
          datum: maps[i]['datum'],
        );
      },
    );
  }

  Future<List<Gefuehle>> getGefuehleSort() async {
    final Database db = await DB.instance.initDB();
    final List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM gefuehle "
            "ORDER BY datum DESC "
            "LIMIT 7");
    List l = List.generate(
      maps.length,
      (i) {
        return Gefuehle(
          gWert: maps[i]['gWert'],
          datum: maps[i]['datum'],
        );
      },
    );

    List<Gefuehle> res = List(l.length);
    for(int i=0; i<l.length; i++){
      res[i] = l[l.length-i-1];
    }
    return res;
  }

  Future<int> getGefuehlHeute() async {
    final Database db = await DB.instance.initDB();
    String date = DateTime.now().year.toString() + "." +
        DateTime.now().month.toString() + "." +
        DateTime.now().day.toString();
    final List<Map<String, dynamic>> maps = await db.query('gefuehle', where: "datum = ?", whereArgs: [date]);
    List l = List.generate(
      maps.length,
          (i) {
        return Gefuehle(
          gWert: maps[i]['gWert'],
          datum: maps[i]['datum'],
        );
      },
    );
    if(!(l.length < 1)){
      return l[0].gWert;
    }
    return 7;
  }

}
