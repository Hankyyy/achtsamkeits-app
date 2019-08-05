import 'package:aaproto2/Database/dbHelper.dart';
import 'package:sqflite/sqflite.dart';

class Aufgaben {
  int id;
  String titel;
  int erledigt;
  String notizen;
  String datum;
  int meilenstein_id;

  Aufgaben({
    this.id,
    this.titel,
    this.erledigt,
    this.notizen,
    this.datum,
    this.meilenstein_id
  });

  Map toMap() {
    Map map = {
      'titel': titel,
      'notizen': notizen,
      'erledigt': erledigt,
      'datum': datum,
      'meilenstein_id': meilenstein_id
    };
    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  static fromMap(Map map){
    Aufgaben a = new Aufgaben();
    a.id = map['id'];
    a.titel = map['titel'];
    a.erledigt = map['erledigt'];
    a.notizen = map['notizen'];
    a.datum = map['datum'];
    a.meilenstein_id = map['meilenstein_id'];

    return a;
  }

  //CRUD
  createAufgaben(Aufgaben a) async{
    final Database db = await DB.instance.initDB();
    var result = await db.rawInsert(
        "INSERT INTO aufgaben (id, titel, erledigt, notizen, datum, meilenstein_id)"
            "VALUES(${a.id}, "
            "${a.titel}, "
            "${a.erledigt}, "
            "${a.notizen}, "
            "${a.titel}, "
            "${a.datum}, "
            "${a.meilenstein_id})"
    );
  }
}
