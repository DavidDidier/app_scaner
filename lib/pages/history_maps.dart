import 'package:app_scaner/widgets/list_scan.dart';
import 'package:flutter/material.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListScan(tipo: 'geo');
  }
}
