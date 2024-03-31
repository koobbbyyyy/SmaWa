/* /* import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final databaseName = "responses.db";
  static final databaseVersion = 1;

  static final table = 'responses';

  static final columnId = '_id';
  static final columnEstimatedAge = 'estimatedAge';
  static final columnBeard = 'beard';
  static final columnEmotionsAndConfidence = 'emotionsAndConfidence';
  static final columnEyeglasses = 'eyeglasses';
  static final columnMustache = 'mustache';
  static final columnSmile = 'smile';
  static final columnSunglasses = 'sunglasses';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, databaseName);
      return await openDatabase(path,
          version: databaseVersion, onCreate: _onCreate);
    } catch (e) {
      print('Error initializing database: $e');
      throw e;
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnEstimatedAge INTEGER,
        $columnBeard TEXT,
        $columnEmotionsAndConfidence TEXT,
        $columnEyeglasses TEXT,
        $columnMustache TEXT,
        $columnSmile TEXT,
        $columnSunglasses TEXT
      )
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }
}
 */

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "myDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'myTable';
  static final columnId = '_id';
  static final columnName = 'name';
  static final columnAge = 'age';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion,
        onCreate: (db, version) {
      db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnAge INTEGER NOT NULL
          )
          ''');
    });
  }
} */