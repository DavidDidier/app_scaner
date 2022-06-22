import 'package:flutter/material.dart';
import '../widgets/list_scan.dart';

class DirectionPage extends StatelessWidget {
  const DirectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListScan(tipo: 'geo');
  }
}
