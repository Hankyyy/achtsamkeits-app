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
}
