import 'package:aaproto2/Database/dbHelper.dart';
import 'package:sqflite/sqflite.dart';

class Meilenstein_db {
  String titel;
  String datum;
  String notizen;

  Meilenstein_db({
    this.titel,
    this.datum,
    this.notizen
  });

  Map<String, dynamic> toMap() {
    return {
      'titel': titel,
      'datum': datum,
      'notizen': notizen,
    };
  }

  Future<void> insertMeilenstein(Meilenstein_db ms) async {
    final Database db = await DB.instance.initDB();
    await db.insert(
      'meilenstein',
      ms.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<String> getMeilenstein(String s) async{
    final Database db = await DB.instance.initDB();
    List<Map<String, dynamic>> map = await db.query('meilenstein', where: "titel =?",
        whereArgs: [s]);
    return map.toString();
  }

//get all entries
  Future<List<Meilenstein_db>> msget() async {
    final Database db = await DB.instance.initDB();
    final List<Map<String, dynamic>> maps = await db.query('meilenstein');
    return List.generate(maps.length, (i) {
      return Meilenstein_db(
        titel: maps[i]['titel'],
        datum: maps[i]['datum'],
        notizen: maps[i]['notizen'],
      );
    });
  }

}

