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
    final List<Map<String, dynamic>> maps = await db.query('produktivitaet', orderBy: "datum DESC");
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
    List l = List.generate(
      maps.length,
      (i) {
        return Produktivitaet(
          pWert: maps[i]['pWert'],
          datum: maps[i]['datum'],
        );
      },
    );

    List<Produktivitaet> res = List(l.length);
    for(int i=0; i<l.length; i++){
      res[i] = l[l.length-i-1];
    }
    return res;
  }

  Future<int> getProduktivitaetHeute() async {
    final Database db = await DB.instance.initDB();
    String date = DateTime.now().year.toString() + "." +
        DateTime.now().month.toString() + "." +
        DateTime.now().day.toString();
    final List<Map<String, dynamic>> maps = await db.query('produktivitaet', where: "datum = ?", whereArgs: [date]);
    List l = List.generate(
      maps.length,
          (i) {
        return Produktivitaet(
          pWert: maps[i]['pWert'],
          datum: maps[i]['datum'],
        );
      },
    );
    if(!(l.length < 1)){
      return l[0].pWert;
    }
    return 7;
  }

}
