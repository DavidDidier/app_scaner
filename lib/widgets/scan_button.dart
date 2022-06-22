// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:app_scaner/providers/provider_list_scan.dart';
import 'package:app_scaner/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.filter_center_focus),
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              "#3D8BEF", "Cancel", false, ScanMode.QR);

          final listScanProvider =
              Provider.of<ProviderListScan>(context, listen: false);
          final newScan = await listScanProvider.newScan(barcodeScanRes);

          launchUrl(context, newScan);
        });
  }
}
