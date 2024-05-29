/*  import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// Initialize FFI loader
void sqfliteFfiInit() {
 sqfliteFfiInit();
}

class FaceDetail {
 int? id;
 int? estimatedAge;
 String? gender;
 String? beard;
 String? mustache;
 String? smile;
 String? sunglasses;
 String? glasses;
 int? emotionsLength;
 String? emotionType;
 double? emotionConfidence;

 Map<String, dynamic> toMap() {
    return {
      'id': id,
      'estimatedAge': estimatedAge,
      'gender': gender,
      'beard': beard,
      'mustache': mustache,
      'smile': smile,
      'sunglasses': sunglasses,
      'glasses': glasses,
      'emotionsLength': emotionsLength,
      'emotionType': emotionType,
      'emotionConfidence': emotionConfidence,
    };
 }
}

class DatabaseHelper {
 static Database? _database;
 static const String _tableName = 'face_details';

 Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDatabase();
    return _database!;
 }

 Future<Database> initializeDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'face_details.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            estimatedAge INTEGER,
            gender TEXT,
            beard TEXT,
            mustache TEXT,
            smile TEXT,
            sunglasses TEXT,
            glasses TEXT,
            emotionsLength INTEGER,
            emotionType TEXT,
            emotionConfidence REAL
          )
          ''');
    });
 }

 Future<void> insertFaceDetail(FaceDetail faceDetail) async {
    final db = await database;
    await db.insert(_tableName, faceDetail.toMap());
 }

 // Additional methods for querying, updating, and deleting data can be added here
}  */