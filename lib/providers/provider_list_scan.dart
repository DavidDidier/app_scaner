import 'package:app_scaner/providers/provider_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ProviderListScan extends ChangeNotifier {
  List<ModelScan> scaneres = [];
  String typeSelect = 'http';

  Future<ModelScan> newScan(String valor) async {
    final newScan = ModelScan(valor: valor);

    final id = await ProviderDB.dataBase.newScan(newScan);
    newScan.id = id;
    if (typeSelect == newScan.tipo) {
      scaneres.add(newScan);
      notifyListeners();
    }
    return newScan;
  }

  cargarScan() async {
    final scans = await ProviderDB.dataBase.getScanAll();
    scaneres = [...scans];
    notifyListeners();
  }

  cargarScanWihtType(String tipo) async {
    final scans = await ProviderDB.dataBase.getScanWithTipo(tipo);
    scaneres = [...scans];
    typeSelect = tipo;
    notifyListeners();
  }

  deleteAllScan() async {
    final scans = await ProviderDB.dataBase.deleteScanAll();
    scaneres = [];
    notifyListeners();
  }

  deleteAllScanId(int id) async {
    final scans = await ProviderDB.dataBase.deleteScan(id);
  }
}
