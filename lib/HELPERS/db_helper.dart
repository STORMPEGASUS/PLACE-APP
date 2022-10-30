import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE PLACES_DB (ID TEXT PRIMARY KEY,TITLE TEXT,IMAGE TEXT)');
    }, version: 1);
  }

  //function to store the data into the database
  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //function to fetch data from the database
  static Future<List<Map<String,dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }
}
