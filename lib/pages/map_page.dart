import 'package:app_scaner/models/model_scan.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ModelScan scaner =
        ModalRoute.of(context)!.settings.arguments as ModelScan;
    return Scaffold(
      appBar: AppBar(
        title: const Text('MAP'),
      ),
      body: Center(
        child: Text(scaner.valor),
      ),
    );
  }
}
