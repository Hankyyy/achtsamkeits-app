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
    return await openDatabase(path, version: _databaseVersion, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await setupTables(db);
          await setupEintraegeDefault(db);
        });
  }
  Future<void> setupTables(Database db) async{
    db.execute("CREATE TABLE meilenstein ("
        "titel TEXT NOT NULL,"
        "datum TEXT NOT NULL,"
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
        "datum TEXT NOT NULL,"
        "pWert INTEGER"
        ")");

    db.execute("CREATE TABLE gefuehle ("
        "datum TEXT NOT NULL,"
        "gWert INTEGER"
        ")");

    db.execute("CREATE TABLE zitate ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "zitat TEXT NOT NULL"
        ")");
  }

  Future<void> setupEintraegeDefault(Database db) async{
    db.execute("INSERT into zitate (id, zitat) "
        "VALUES(1 , 'Hello World')");
    db.execute("INSERT into zitate (id, zitat) "
        "VALUES(2 , 'testtest')");
  }


}
