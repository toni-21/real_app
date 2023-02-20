import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  int _selectedTab = 0;

  int get getSelectedTab => _selectedTab;

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

}