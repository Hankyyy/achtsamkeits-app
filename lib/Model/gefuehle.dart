import 'package:ape_of_mind/Database/dbHelper.dart';
import 'package:sqflite/sqflite.dart';

class Gefuehle {
  //int id;
  int gWert;
  String datum;

  Gefuehle({
    //this.id,
    this.gWert,
    this.datum
  });

  Map<String, dynamic> toMap() {
    return {
      'gWert': gWert,
      'datum': datum,
    };
  }

  Future<void> insertGefuehle(Gefuehle g) async {
    final Database db = await DB.instance.initDB();
    await db.insert(
      'gefuehle',
      g.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //liefert alle Einträge
  Future<List<Gefuehle>> msget() async {
    final Database db = await DB.instance.initDB();
    final List<Map<String, dynamic>> maps = await db.query('gefuehle');
    return List.generate(maps.length, (i) {
      return Gefuehle(
        gWert: maps[i]['gWert'],
        datum: maps[i]['datum'],
      );
    });
  }

}