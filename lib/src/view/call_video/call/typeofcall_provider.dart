import 'package:flutter/material.dart';

class TypeOfCallProvider with ChangeNotifier {
  int _selectedIndex;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int selectedIndex) {
    _selectedIndex = selectedIndex;
    notifyListeners();
  }
}
