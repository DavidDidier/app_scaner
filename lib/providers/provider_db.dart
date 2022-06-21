import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ProviderDB {
  static Database _database = {} as Database;

  static final ProviderDB dataBase = ProviderDB._();

  ProviderDB._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDataBase();

    return _database;
  }

  Future<Database> initDataBase() async {
    //Path en dónde almacenaresmos la base de datos

    Directory documentDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentDirectory.path, 'ScansDB.db');
    print(path);
    //crear base de datos

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo VARCHAR(255),
          valor VARCHAR(255)
        )
      ''');
    });
  }
}
