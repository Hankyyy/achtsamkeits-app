import 'package:ape_of_mind/Database/dbHelper.dart';
import 'package:sqflite/sqflite.dart';

class Aufgaben {
  //int id;
  String titel;
  int erledigt;
  String datum;
  String meilenstein_id;

  Aufgaben({
    //this.id,
    this.titel,
    this.erledigt,
    this.datum,
    this.meilenstein_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'titel': titel,
      'erledigt': erledigt,
      'datum': datum,
      'meilenstein_id': meilenstein_id,
    };
  }

  Future<void> insertAufgabe(Aufgaben a) async {
    final Database db = await DB.instance.initDB();
    await db.insert(
      'aufgaben',
      a.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

//einzelne Aufgaben, unabhängig von Meilensteinen!!
  Future<String> getAufgaben(String s) async {
    final Database db = await DB.instance.initDB();
    List<Map<String, dynamic>> map =
        await db.query('aufgaben', where: "titel =?", whereArgs: [s]);
    return map.toString();
  }

  Future<List<Aufgaben>> aufgabenMS(String titel) async {
    final Database db = await DB.instance.initDB();
    List<Map<String, dynamic>> map = await db
        .query('aufgaben', where: "meilenstein_id =?", whereArgs: [titel]);
    return List.generate(
      map.length,
      (i) {
        return Aufgaben(
          titel: map[i]["titel"],
          erledigt: map[i]["erledigt"],
          datum: map[i]["datum"],
          meilenstein_id: map[i]["meilenstein_id"],
        );
      },
    );
  }

  Future<void> checkAF(String titel, String meilenstein_id, int erledigt) async {
    final Database db = await DB.instance.initDB();
    if(erledigt == 0){
      await db.rawUpdate('''
    UPDATE aufgaben
    SET erledigt = ?
    WHERE titel = ? AND meilenstein_id = ?
    ''', [1, titel, meilenstein_id]);
    }
    else {
      await db.rawUpdate('''
    UPDATE aufgaben
    SET erledigt = ?
    WHERE titel = ? AND meilenstein_id = ?
    ''', [0, titel, meilenstein_id]);
    }
  }

  Future<void> deleteAF(String titel) async {

    final Database db = await DB.instance.initDB();
    await db.rawDelete('DELETE FROM aufgaben WHERE meilenstein_id = ?', [titel]);
  }

  Future<void> deleteAFS(String titel, String meilenstein_id) async {

    final Database db = await DB.instance.initDB();
    await db.rawDelete('DELETE FROM aufgaben WHERE meilenstein_id = ? AND WHERE titel = ?', [meilenstein_id, titel]);
  }

}
