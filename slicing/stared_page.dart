import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'tasks_database.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE lists(id INTEGER PRIMARY KEY, name TEXT)',
        );
      },
    );
  }

  Future<List<String>> getLists() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('lists');
    return List.generate(maps.length, (i) => maps[i]['name'] as String);
  }

  Future<void> addList(String name) async {
    final db = await database;
    await db.insert(
      'lists',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
