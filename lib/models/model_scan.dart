// To parse this JSON data, do
//
//     final modelScan = modelScanFromJson(jsonString);

import 'dart:convert';

ModelScan modelScanFromJson(String str) => ModelScan.fromJson(json.decode(str));

String modelScanToJson(ModelScan data) => json.encode(data.toJson());

class ModelScan {
  ModelScan({
    required this.id,
    required this.tipo,
    required this.valor,
  }) {
    if (tipo.contains('http')) {
      tipo = 'http';
    } else {
      tipo = 'geo';
    }
  }

  int id;
  String tipo;
  String valor;

  factory ModelScan.fromJson(Map<String, dynamic> json) => ModelScan(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
