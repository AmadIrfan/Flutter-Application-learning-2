import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

class DbHelper {
  static Future<Database> database() async {
    // final dbPath = await sql.getDatabasesPath();
    // return await sql.openDatabase(path.join(dbPath, "plaseDb"),
    //     onCreate: (dtb, version) {
    //   return dtb
    //       .execute("CREATE TABLE users_Plase(id TEXT PRIMARY KEY,title TEXT)");
    // }, version: 1);
    final dbPath = await sql.getDatabasesPath();
    return await sql.openDatabase(path.join(dbPath, 'placeDB'),
        onCreate: ((db, version) => db.execute(
            'CREATE TABLE user_place(id TEXT PRIMARY KEY,title TEXT ')),
        version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbHelper.database();
    db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbHelper.database();
    return db.query(table);
  }
}
