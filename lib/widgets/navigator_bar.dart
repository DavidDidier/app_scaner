import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/provider_ui.dart';

class NavigatorBar extends StatelessWidget {
  const NavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UIProvider uiProvider = Provider.of<UIProvider>(context);

    final currentIndex = uiProvider.selectedOpt;
    return BottomNavigationBar(
        onTap: (int i) => uiProvider.selectedOpt = i,
        currentIndex: currentIndex,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Maps'),
          BottomNavigationBarItem(
              icon: Icon(Icons.compass_calibration), label: 'Directions'),
        ]);
  }
}
