import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  int _selectedMenuOpt = 0;

  int get selectedOpt {
    return _selectedMenuOpt;
  }

  set selectedOpt(int i) {
    _selectedMenuOpt = i;
    notifyListeners();
  }
}
