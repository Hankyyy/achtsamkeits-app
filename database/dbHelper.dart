//#####################new created Yannick auslagern
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:achtsamkeit/model/sleep.dart';

class DBHelper{
  Database _db;

  DBHelper();

  initDb() async {
    String databasePath = await getDatabasesPath(); //Stellen im Projekt aufrufen wo unsere DB gespeichert werden soll
    String path = join(databasePath, "myDatabase.db"); //Pfad der Datenbank

    var db = await openDatabase(path, version: 1, onCreate: onCreate); //öffnen der Datenbank
    return db;
  }

  void onCreate(Database db, int version) async{
    await db.execute("CREATE TABLE Sleep(id INTEGER PRIMARY KEY, "
        "name TEXT, "
        "beschreibung TEXT, "
        "anzahl DOUBLE)");
  }
/*
* Asynchronous operations let your program complete other work while waiting
* for an operation to finish. Dart uses Future objects (futures) to represent
* the results of asynchronous operations. ... While Dart code is executing,
* no other code in the same isolate can run.
* */
  //Dafür dass unsere DB nicht immer wieder neu überschrieben wird
  //Wird also nur einmal erstellt
  Future<Database> get db async{ //getter db, returned Future<Database>
    if(_db == null){
      _db = await initDb();
      return _db;
    } else{
      return _db;
    }
  }
//Methode Typ Future, int Rückgabewert

  //create
  Future<int> createSleep(Sleep sleep) async{
    var dbReady = await db;
    return await dbReady.rawInsert("INSERT INTO Sleep(name, beschreibung, anzahl)"
        "VALUES ('${sleep.name}', '${sleep.beschreibung}, '${sleep.anzahl}')");
  }

  //update
  Future<int> updateSleep(Sleep sleep) async{
    var dbReady = await db;
    return await dbReady.rawInsert("UPDATE Sleep SET"
        "beschreibung = '${sleep.beschreibung}', "
        "anzahl= '${sleep.anzahl}' WHERE name = '${sleep.name}'");
  }

  //delete
  Future<int> deleteSleep(Sleep name) async{
    var dbReady = await db;
    return await dbReady.rawInsert("DELETE FROM Sleep WHERE name = '$name'");
  }

  //read
  Future<Sleep> readSleep(String name) async{
    var dbReady = await db;
    var read = await dbReady.rawQuery("Select * FROM Sleep WHERE name = $name"); //read ist eine map

    return Sleep.fromMap(read[0]);
  }
}