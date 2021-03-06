import 'package:app_scaner/providers/provider_list_scan.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/provider_db.dart';
import '../providers/provider_ui.dart';
import '../widgets/navigator_bar.dart';
import '../widgets/scan_button.dart';
import 'directions_page.dart';
import 'history_maps.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text('Historial')),
        actions: [
          IconButton(
              onPressed: () {
                final listScanProvider =
                    Provider.of<ProviderListScan>(context, listen: false);
                listScanProvider.deleteAllScan();
              },
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const NavigatorBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UIProvider uiProvider = Provider.of<UIProvider>(context);

    final currentIndex = uiProvider.selectedOpt;

    final listScanProvider =
        Provider.of<ProviderListScan>(context, listen: false);

    //Leer base de datos temporalmente

    ProviderDB.dataBase.database;

    switch (currentIndex) {
      case 0:
        listScanProvider.cargarScanWihtType('geo');
        return const MapsPage();
      case 1:
        listScanProvider.cargarScanWihtType('http');
        return const DirectionPage();
      default:
        return const MapsPage();
    }
  }
}
