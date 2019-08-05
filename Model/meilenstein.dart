import 'package:aaproto2/Database/dbHelper.dart';
import 'package:sqflite/sqflite.dart';

class Meilenstein {
  int id;
  String titel;
  String datum;

  Meilenstein({
    this.id,
    this.titel,
    this.datum
  });

  Map toMap() {
    Map map = {
      'titel': titel,
      'datum': datum,
    };
    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  static fromMap(Map map){
    Meilenstein ms = new Meilenstein();
    ms.id = map['id'];
    ms.titel = map['titel'];
    ms.datum = map['datum'];

    return ms;
  }

  //CRUD
  createMeilenstein(Meilenstein ms) async{
    final Database db = await DB.instance.initDB();
    var result = await db.rawInsert(
        "INSERT INTO meilenstein (id, titel, datum)"
            "VALUES(${ms.id}, "
            "${ms.titel}, "
            "${ms.datum})"
    );
  }

  Future<List> getMeilenstein() async { // query noch nicht fertig
    final Database db = await DB.instance.initDB();
    var result = await db.rawQuery('SELECT * FROM meilenstein where id=?');
    return result.toList();
  }

}
