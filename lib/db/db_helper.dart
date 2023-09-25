
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_app/models/task_model.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "tasks";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = '${await getDatabasesPath()}tasks.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print('Creating a new one...');
          return db.execute(
            "CREATE TABLE $_tableName("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "title STRING, note TEXT, date STRING, "
            "startTime STRING, endTime STRING, "
            "reminder INTEGER, repeat STRING, "
            "color INTEGER, "
            "isCompleted INTEGER ) ",
          );
        },
      );
    } catch (e) {
      print("error in creating table");
      print(e.toString());
    }
  }

  static Future<int> insert(TaskModel? task) async {
    print("insert function called");
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    debugPrint("query function called");
    return await _db!.query(_tableName);
  }
  static   delete (TaskModel task)async{
    return await _db?.delete(_tableName,
        where: "id=?",
        whereArgs: [task.id]
    );
  }
}
