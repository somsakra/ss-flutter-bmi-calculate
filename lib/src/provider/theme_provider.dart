import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark;

  ThemeProvider({this.isDark=false});

  void toggleTheme({required bool value}) async {
    isDark = value;
    notifyListeners();
  }
}
