import 'package:aaproto2/Database/dbHelper.dart';
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

  Future<void> insertAufgabe(Aufgaben a) async{
    final Database db = await DB.instance.initDB();
    await db.insert(
      'aufgaben',
      a.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

//einzelne Aufgaben, unabhängig von Meilensteinen!!
  Future<String> getAufgaben(String s) async{
    final Database db = await DB.instance.initDB();
    List<Map<String, dynamic>> map = await db.query('aufgaben', where: "titel =?",
        whereArgs: [s]);
    return map.toString();
  }
}
