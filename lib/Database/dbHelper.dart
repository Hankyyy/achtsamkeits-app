import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  // make this a singleton class
  DB._privateConstructor();

  static final DB instance = DB._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await setupTables(db);
        await setupEintraegeDefault(db);
      },
    );
  }

  Future<void> setupTables(Database db) async {
    db.execute("CREATE TABLE meilenstein ("
        "titel TEXT NOT NULL,"
        "datum TEXT NOT NULL,"
        "deadline TEXT NOT NULL,"
        "notizen TEXT NOT NULL"
        ")");

    db.execute("CREATE TABLE aufgaben ("
        "titel TEXT NOT NULL,"
        "erledigt INTEGER NOT NULL,"
        "datum TEXT NOT NULL,"
        "meilenstein_id TEXT NOT NULL,"
        "FOREIGN KEY (meilenstein_id) REFERENCES meilenstein (titel)"
        ")");

    db.execute("CREATE TABLE produktivitaet ("
        "datum TEXT NOT NULL UNIQUE,"
        "pWert INTEGER"
        ")");

    db.execute("CREATE TABLE gefuehle ("
        "datum TEXT NOT NULL UNIQUE,"
        "gWert INTEGER"
        ")");

    db.execute("CREATE TABLE zitate ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "zitat TEXT NOT NULL"
        ")");

    db.execute("CREATE TABLE theme ("
        "id INTEGER NOT NULL"
        ")");
  }

  Future<void> setupEintraegeDefault(Database db) async {
    db.execute("INSERT into zitate (id, zitat) "
        "VALUES(1 , 'Hello World')");
    db.execute("INSERT into zitate (id, zitat) "
        "VALUES(2 , 'testtest')");
    db.execute("INSERT into theme (id) "
        "VALUES(0) ");

    //testwerte
 /*
    db.execute("INSERT INTO gefuehle (datum, gWert) "
        "VALUES('2019.10.1', 4)");
    db.execute("INSERT INTO gefuehle (datum, gWert) "
        "VALUES('2019.10.2', 3)");
    db.execute("INSERT INTO gefuehle (datum, gWert) "
        "VALUES('2019.10.3', 3)");
    db.execute("INSERT INTO gefuehle (datum, gWert) "
        "VALUES('2019.10.4', 4)");
    db.execute("INSERT INTO gefuehle (datum, gWert) "
        "VALUES('2019.10.5', 1)");
    db.execute("INSERT INTO gefuehle (datum, gWert) "
        "VALUES('2019.10.6', 3)");
    db.execute("INSERT INTO gefuehle (datum, gWert) "
        "VALUES('2019.10.7', 2)");


    db.execute("INSERT INTO produktivitaet (datum, pWert) "
        "VALUES('2019.10.1', 5)");
    db.execute("INSERT INTO produktivitaet (datum, pWert) "
        "VALUES('2019.10.2', 5)");
    db.execute("INSERT INTO produktivitaet (datum, pWert) "
        "VALUES('2019.10.3', 3)");
    db.execute("INSERT INTO produktivitaet (datum, pWert) "
        "VALUES('2019.10.4', 1)");
    db.execute("INSERT INTO produktivitaet (datum, pWert) "
        "VALUES('2019.10.5', 2)");
    db.execute("INSERT INTO produktivitaet (datum, pWert) "
        "VALUES('2019.10.6', 1)");
    db.execute("INSERT INTO produktivitaet (datum, pWert) "
        "VALUES('2019.10.7', 4)");

 */
  }
}
