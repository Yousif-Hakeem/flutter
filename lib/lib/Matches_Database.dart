import 'package:flutter_application_2/matches_attrib.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDb {
  Future<Database> initializeDb() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'Worlds'),
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE matches( firstTeam  TEXT ,secondTeam TEXT,  duration INTEGER, locationTEXT )');
      },
    );
  }

  Future<void> insertData(TheMatches x) async {
    Database db = await initializeDb();
    await db.insert('matches', x.toMap());
    print('match added succesfully!');
  }

  Future<List<TheMatches>> getfromDb() async {
    Database db = await initializeDb();
    List<Map<String, dynamic>> data = await db.query('matches');
    List<TheMatches> matches = data.map((e) {
      TheMatches newMatch = TheMatches.fromMap(e);
      return newMatch;
    }).toList();
    return matches;
  }
}
