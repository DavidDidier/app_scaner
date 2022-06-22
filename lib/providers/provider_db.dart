import 'dart:io';

import 'package:app_scaner/models/model_scan.dart';
export 'package:app_scaner/models/model_scan.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ProviderDB {
  static Database? _database;

  static ProviderDB dataBase = ProviderDB._();

  ProviderDB._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDataBase();

    return _database!;
  }

  Future<Database> initDataBase() async {
    //Path en dónde almacenaresmos la base de datos

    Directory documentDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentDirectory.path, 'ScansDB.db');
    //crear base de datos

    return await openDatabase(path, version: 1, onOpen: (db) async {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Scaneres(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        )
      ''');
    });
  }

  // Future<int> newScanRaw(ModelScan newScan) async {
  //   final id = newScan.id;
  //   final tipo = newScan.tipo;
  //   final valor = newScan.valor;
//
  //   //Verifica la base de datos
  //   final dataB = await database;
//
  //   final resp = await dataB.rawInsert('''
  //     INSERT INTO Scaneres(id, tipo, valor)
  //       VALUES($id, '$tipo', '$valor')
//
  //   ''');
  //   return resp;
  // }

  Future<int> newScan(ModelScan newScan) async {
    final databa = await database;

    final resp = await databa.insert('Scaneres', newScan.toJson());

    print(resp);

    return resp;
  }

  Future<ModelScan?> getScanWithId(int id) async {
    final db = await database;
    final resp = await db.query('Scaneres', where: 'id= ?', whereArgs: [id]);

    return resp.isNotEmpty ? ModelScan.fromJson(resp.first) : null;
  }

  Future<List<ModelScan>> getScanAll() async {
    final db = await database;
    final resp = await db.query('Scaneres');

    return resp.isNotEmpty
        ? resp.map((e) => ModelScan.fromJson(e)).toList()
        : [];
  }

  Future<List<ModelScan>> getScanWithTipo(String tipo) async {
    final db = await database;
    final resp = await db.rawQuery(''''
    SELECT * FROM Scaneres WHERE tipo = $tipo
''');
    return resp.isNotEmpty
        ? resp.map((e) => ModelScan.fromJson(e)).toList()
        : [];
  }

  Future<int> updateScan(ModelScan newScan) async {
    final db = await database;

    final resp = await db.update('Scaneres', newScan.toJson(),
        where: 'id=?', whereArgs: [newScan]);
    return resp;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;

    final resp =
        await db.delete('Scaneres', where: 'id=?', whereArgs: [newScan]);
    return resp;
  }

  Future<int> deleteScanAll() async {
    final db = await database;

    final resp = await db.delete('Scaneres');
    return resp;
  }
}
