import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/provider_list_scan.dart';
import '../utils/utils.dart';

class ListScan extends StatelessWidget {
  final String tipo;
  const ListScan({Key? key, required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listScanProvider = Provider.of<ProviderListScan>(context);
    final unScan = listScanProvider.scaneres;
    return ListView.builder(
        itemCount: unScan.length,
        itemBuilder: (_, i) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.redAccent,
              ),
              onDismissed: (DismissDirection direction) {
                Provider.of<ProviderListScan>(context, listen: false)
                    .deleteAllScanId(unScan[i].id!);
              },
              child: ListTile(
                leading: Icon(
                  tipo == 'geo' ? Icons.map : Icons.home,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(unScan[i].valor),
                subtitle: Text(unScan[i].id.toString()),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Theme.of(context).primaryColor,
                ),
                onTap: () => launchUrl(context, unScan[i]),
              ),
            ));
  }
}
