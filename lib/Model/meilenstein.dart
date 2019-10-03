import 'package:ape_of_mind/Database/dbHelper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:ape_of_mind/Model/aufgaben.dart';

class Meilenstein_db {
  String titel;
  String datum;
  String deadline;
  String notizen;

  Meilenstein_db({this.titel, this.datum, this.deadline, this.notizen});

  Map<String, dynamic> toMap() {
    return {
      'titel': titel,
      'datum': datum,
      'deadline': deadline,
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

  Future<String> getMeilenstein(String s) async {
    final Database db = await DB.instance.initDB();
    List<Map<String, dynamic>> map =
        await db.query('meilenstein', where: "titel =?", whereArgs: [s]);
    return map.toString();
  }

//get all entries
  Future<List<Meilenstein_db>> msget() async {
    final Database db = await DB.instance.initDB();
    final List<Map<String, dynamic>> maps = await db.query('meilenstein', orderBy: "datum ASC");
    return List.generate(
      maps.length,
      (i) {
        return Meilenstein_db(
          titel: maps[i]['titel'],
          datum: maps[i]['datum'],
          deadline: maps[i]['deadline'],
          notizen: maps[i]['notizen'],
        );
      },
    );
  }

  Future<void> updateMS(String titel, String datum, String deadline, String notizen) async {
    final Database db = await DB.instance.initDB();
    await db.rawUpdate('''
    UPDATE meilenstein
    SET datum = ?, deadline = ?, notizen = ?
    WHERE titel = ?
    ''', [datum, deadline, notizen, titel]);
  }

  Future<void> deleteMS(String titel) async {
    Aufgaben af = new Aufgaben();
    af.deleteAF(titel);
    final Database db = await DB.instance.initDB();
    await db.rawDelete('DELETE FROM meilenstein WHERE titel = ?', [titel]);
  }
}
