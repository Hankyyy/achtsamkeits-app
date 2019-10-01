import 'package:ape_of_mind/Database/dbHelper.dart';
import 'package:sqflite/sqflite.dart';

class ApeTheme {

  int id;

  ApeTheme(
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  //liefert alle Einträge
  Future<int> getThemeInt() async {
    final Database db = await DB.instance.initDB();
    final List<Map<String, dynamic>> maps = await db.query('theme');
    List.generate(
      maps.length,
          (i) {
        return ApeTheme(
          id: maps[i]['id'],
        );
      },
    );
    return maps.first.values.first;
  }

  Future<void> updateTheme(int i) async {
    final Database db = await DB.instance.initDB();
    await db.rawUpdate('''
    UPDATE theme
    SET id = ?
    ''', [i]);
  }
}