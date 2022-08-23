import 'package:animation/data/cached_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class LocalDataBase {
  static final LocalDataBase getInstance = LocalDataBase._();
  factory LocalDataBase() => getInstance;
  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDb("notes.db");
      return _database!;
    }
  }

  Future<Database> _initDb(String dataBaseName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dataBaseName);
    return await openDatabase(path, version: 1, onCreate: _creatDB);
  }

  Future _creatDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const intType = "INTEGER DEFAULT 0";
    const textType = "TEXT NOT NULL";

    await db.execute("""
  CREATE TABLE $tabelName(
    ${NotesTablesFields.id} $idType,
    ${NotesTablesFields.date} $textType,
    ${NotesTablesFields.subtitle} $textType,
    ${NotesTablesFields.title} $textType
  )
""");
  }

  LocalDataBase._();

  static Future<List<NotesTable>> getAllNotes() async {
    final db = await getInstance.database;
    final result = await db.query(tabelName);
    return result.map((e) => NotesTable.fromJson(e)).toList();
  }

  static Future<int> addToNotes(NotesTable notesTable) async {
    final db = await getInstance.database;
    return db.insert(tabelName, notesTable.toJson());
  }

  static Future<int> deleteById(int id) async {
    final db = await getInstance.database;
    return db.delete(tabelName,
        where: "${NotesTablesFields.id} = ?", whereArgs: [id]);
  }

  static Future edit(int id, String title, String subtitle) async {
    final db = await getInstance.database;
    Map<String, Object?> row = {
      NotesTablesFields.id: id,
      NotesTablesFields.subtitle: subtitle,
      NotesTablesFields.title: title,
    };
    return db.update(tabelName, row,
        where: "${NotesTablesFields.id} = ?", whereArgs: [id]);
  }
}
