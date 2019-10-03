import 'package:ape_of_mind/Database/dbHelper.dart';
import 'package:sqflite/sqflite.dart';

class Produktivitaet {
  //int id;
  int pWert;
  String datum;

  Produktivitaet(
      {
      //this.id,
      this.pWert,
      this.datum});

  Map<String, dynamic> toMap() {
    return {
      'pWert': pWert,
      'datum': datum,
    };
  }

  Future<void> insertProduktivitaet(Produktivitaet p) async {
    final Database db = await DB.instance.initDB();
    /*await db.insert(
      'produktivitaet',
      p.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );*/
    print(p.datum);
    await db.rawInsert(
        "INSERT OR REPLACE INTO produktivitaet(datum, pWert) VALUES (?, ?)",
        [p.datum, p.pWert]);
  }

  //liefert alle Einträge
  Future<List<Produktivitaet>> getProduktivitaet() async {
    final Database db = await DB.instance.initDB();
    final List<Map<String, dynamic>> maps = await db.query('produktivitaet');
    return List.generate(maps.length, (i) {
      return Produktivitaet(
        pWert: maps[i]['pWert'],
        datum: maps[i]['datum'],
      );
    });
  }

  Future<List<Produktivitaet>> getProduktivitaetSort() async {
    final Database db = await DB.instance.initDB();
    final List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM produktivitaet "
            "ORDER BY datum DESC "
            "LIMIT 7");
    return List.generate(
      maps.length,
      (i) {
        return Produktivitaet(
          pWert: maps[i]['pWert'],
          datum: maps[i]['datum'],
        );
      },
    );
  }
}
