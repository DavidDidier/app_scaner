import 'package:app_scaner/models/model_scan.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

launchUrl(BuildContext context, ModelScan scan) async {
  final Uri url = Uri.parse(scan.valor);

  if (scan.tipo == 'http') {
    if (await canLaunchUrl(url)) {
      await launchUrl(context, scan);
    } else {
      throw 'No se encontro la $url';
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
