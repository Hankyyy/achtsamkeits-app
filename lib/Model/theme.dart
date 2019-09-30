import 'package:ape_of_mind/Database/dbHelper.dart';
import 'package:sqflite/sqflite.dart';

class Theme {

  int id;

  Theme(
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  //liefert alle Einträge
  Future<String> getTheme() async {
    final Database db = await DB.instance.initDB();
    final List<Map<String, dynamic>> maps = await db.query('theme');
    List.generate(
      maps.length,
          (i) {
        return Theme(
          id: maps[i]['id'],
        );
      },
    );
    return maps.first.toString();
  }

  Future<void> updateTheme(int i) async {
    final Database db = await DB.instance.initDB();
    await db.rawUpdate('''
    UPDATE theme
    SET id = ?
    ''', [i]);
  }
}